.PHONY: lint, fix, ci

CURRENT_DIR := $(shell pwd)

lint:
	terraform validate
	terraform fmt -check -recursive
	tflint --recursive --config "$(CURRENT_DIR)/.tflint.hcl"

fix:
	terraform fmt -recursive
	tflint --recursive --fix --config "$(CURRENT_DIR)/.tflint.hcl"

ci:
	terraform fmt -check -recursive
	terraform validate
	tflint --recursive --config "$(CURRENT_DIR)/.tflint.hcl"
