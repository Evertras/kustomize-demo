.PHONY: default
default: ./bin/kustomize
	kubectl get ns
	@echo Ready!

.PHONY: base
base: ./bin/kustomize
	./bin/kustomize build deploy/base

.PHONY: dev
dev:
	./bin/kustomize build deploy/development

.PHONY: stg
stg:
	./bin/kustomize build deploy/staging

.PHONY: prod
prod:
	./bin/kustomize build deploy/production

./bin/kustomize:
	@mkdir -p bin
	@cd bin && curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
