# CloudHero Local Dev Environment

## Prerequisites
- VirtualBox (tested using VirtualBox 6.0.x).
- Vagrant
- Virtualization enabled on your system (if using Windows).

This Local Dev Environment is created using Vagrant and aims to offer a one-click setup experience to developers.

The steps to creating the VM for the local DEV environment are:
1. Run `vagrant up`.
2. Run `vagrant ssh`.
3. To check that all is up and running you should run:
```
$ kubectl get ns
```

and see

```
NAME              STATUS   AGE
default           Active   2m1s
kube-node-lease   Active   2m2s
kube-public       Active   2m2s
kube-system       Active   2m2s
metallb-system    Active   112s
```

and

```
docker ps
```

and see

```
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

- To stop the VM run `vagrant halt` inside the vagrant folder. To start a VM from a `Stopped` or `Aborted` state, use `vagrant up`.