# Gotest

A sample Elixir application based on CentOS, and configured to be Kubernetes ready.

## Testing the application

Simply run `docker-compose up test`. Docker will create the dev image, and start a container to execute the test suite.

## Building a production image

First, run `docker-compose up build` to compile the application. Docker should create a dev image and a container to run the compilation process. Once, the application is done compiling, run `docker-compose build release` to create a production Docker image.

## Deploy to minikube for local Kubernetes testing

First, start your minikube cluster by running `minikube start --vm-driver=xhyve`. In this case, minikube will start a virtual cluster using [`xhyve`](https://github.com/mist64/xhyve) to virtualize the cluster. However, minikube also supports other virtualization tool. Check minikube's documentation to find one that's appropriate for you.

Once a cluster is created, run `kubectl create -f ./deployments/postgres.yaml` to create a database deployment for our application. Then, run `kubectl create -f ./deployments/gotest.yaml` to create the application deployment.

Since this is our first time running, we need to run a migration for the database. To do this, first we need to connect into an application pod by
1. run `kubectl get po` to find the generated name for our pod. The name should start with `gotest-`.
2. run `kubectl exec -it ${POD_NAME} bash` to gain access to the pod
3. run `/gotest/bin/gotest remote_console` to gain access to the IEx shell
4. run `Ecto.Migrator.run(Gotest.Repo, Path.join([:code.priv_dir(:gotest), "repo", "migrations"]), :up, all: true)` from inside IEx shell to run the migrator for our application.

The database should now be migrated with our database schema.

To gain web access to the pod, get the service IP address from minikube by running `minikube service gotest --url`. To access the Kubernetes dashboard for minikube, run `minikube dashboard` and it will open a new tab to the management dashboard.