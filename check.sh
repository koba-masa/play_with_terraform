#!/bin/sh

# if use aws-valut, set `USE_AWS_VAULT` to 1 and set `AWS_VALUT_PROFILE` to your profile name or set it as the first argument.
# 0: false, 1: true
USE_AWS_VAULT=0

function check() {
  local directory=$1

  cd ${directory}

  environments_dir=`ls -1 | grep environments`

  local current_workspace=`get_current_workspace`
  local workspaces=`get_workspaces`
  if [ -z "${workspaces}" ]; then
    workspaces="default"
  fi

  for workspace in $workspaces
  do
    #echo "workspace: ${workspace}"
    check_without_identifier ${workspace}
    check_wit_identifier ${workspace} ${directory}
  done

  switch_workspace ${current_workspace}
  cd ..
}

function get_current_workspace() {
  local workspace=`${aws_valut_command}terraform workspace show`
  echo "${workspace}"
}

function get_workspaces() {
  switch_workspace "default"
  local workspaces=`${aws_valut_command}terraform workspace list | grep -v default | awk '{print $1}'`
  echo "${workspaces}"
}

function check_without_identifier() {
  local workspace=$1
  local var_file="environments/${workspace}.tfvars"
  local option=""
  if [ -e ${var_file} ]; then
    optin="-var-file=${var_file}"
  fi

  initialize
  switch_workspace ${workspace}
  plan "${option}"
}

function check_with_identifier() {
  local workspace=$1
  local directory=$2

  local identifiers=`find environments/${workspace} -type f -depth 1`

  for identifier in $identifiers
  do
    tfstate_key="${directory}/`basename ${identifier} .tfvars`.tfstate"
    initialize ${tfstate_key}
    switch_workspace ${workspace}
    plan "-var-file=${identifier}"
  end
}

function initialize() {
  local option=""
  if [ $# -ne 0 ]; then
    option="-backend-config='key=${1}'"
  fi
  ${aws_valut_command}terraform init -reconfigure ${option}
}

function switch_workspace() {
  local workspace=$1
  ${aws_valut_command}terraform workspace select ${workspace}
}

function plan() {
  local option=$1

  result=`terraform plan ${option} | grep "No changes."`
  if [ -n "${result}" ]; then
    result="OK"
  else
    result="NG"
  fi

  echo "${directory} ${workspace} ${identifier} ${result}" > ${result_file}
}


# ------------------------------------
aws_valut_profile=""
aws_valut_command=""
result_file="`pwd`/result.txt"

if [ "${USE_AWS_VAULT}" == "1" ]; then
  if [ -n "${AWS_VALUT_PROFILE}" ]; then
    aws_valut_profile=${AWS_VALUT_PROFILE}
  elif [ $# -ne 0 ]; then
    aws_valut_profile=$1
  else
    echo "aws-valut profile is not set."
    exit 1
  fi

  aws_valut_command="aws-vault exec ${aws_valut_profile} -- "
fi

rm -f ${result_file}

directories=`ls -d1 */ | grep -v tmp/ | grep -v template/ | grep -v src/ | grep -v docs/ | grep -v remote_state_verification/`
for directory in $directories
do
  check "${directory}"
done

echo "Chekc done.: ${result_file}"
