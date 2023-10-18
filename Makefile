.PHONY: format, lint, fix, ci

format:
	terraform fmt -recursive

lint:
	terraform validate
	tflint --recursive

fix:
	tflint --recursive --fix

ci:
	terraform fmt -recursive
	terraform validate
	tflint --recursive
