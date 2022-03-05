# kustomize-demo

Quick demo playing with Kustomize.

Referenced heavily from https://github.com/kubernetes-sigs/kustomize/blob/master/examples/helloWorld/kustomization.yaml

## The demo app

We use [hello](https://github.com/monopole/hello) as a demo application here.
It allows us to change some arbitrary configuration for demonstration purposes.

## Checking Kustomize output

```bash
# Check each of the environments by viewing the output, does NOT apply!
make dev
make stg
make prod

# These are just doing something like the following for convenience
./bin/kustomize build deploy/development

# Check the difference between any environment
./diff.sh base development
./diff.sh development production
```

## Applying

We can use the built in `kubectl -k` flag to send Kustomize definitions.

```bash
kubectl -k deploy/development
kubectl -k deploy/staging
kubectl -k deploy/production
```

Now we can check the output by going to:

* Dev: http://localhost:8666
* Stg: http://localhost:8667
* Prod: http://localhost:8668
