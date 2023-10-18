.PHONY: format, lint, fix, ci

CURRENT_DIR := $(shell pwd)

format:
	terraform fmt -recursive

lint:
	terraform validate
	tflint --recursive --config "$(CURRENT_DIR)/.tflint.hcl"

fix:
	tflint --recursive --fix --config "$(CURRENT_DIR)/.tflint.hcl"

ci:
	terraform fmt -recursive
	terraform validate
	tflint --recursive --config "$(CURRENT_DIR)/.tflint.hcl"
