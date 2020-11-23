# CloudHero Local Dev Environment

## Prerequisites
- VirtualBox.
- Vagrant
- Virtualization enabled on your system (if using Windows).

## Installing VirtualBox

In order to install VirtualBox, use this link:

https://www.virtualbox.org/wiki/Downloads

## Installing Vagrant

Vagrant offers install options for all operating systems as well:

https://www.vagrantup.com/downloads.html

There are installers for Mac, Windows, Debian and CentOS.

If you have any other Linux Distribution, you can choose the `Linux` tab and download the binary.

After that, you can go to your Downloads forlder and run `sudo mv vagrant /usr/local/bin/` to put
it somewhere where your terminal can find it (this step is necessary only if you are using the binary from the `Linux` tab).

After installing, commands like `vagrant version` should work from anywhere.

For Windows we recommend that you use Power Shell, instead of cmd.

## Getting Started

This Local Dev Environment is created using Vagrant and aims to offer a one-click setup experience to developers.

The steps to creating the VM for the local DEV environment are:
1. Download Git:
    - For Ubuntu/Debian -> `apt install git`
    - For Windows -> https://git-scm.com/download/win
    - For MacOS -> https://git-scm.com/download/mac
2. Clone this repository:
    - `git clone https://github.com/cloud-hero/vagrant-microk8s.git`
3. Enter the repo directory:
    - `cd vagrant-microk8s`
4. Run `vagrant up`.
5. Run `vagrant ssh`.
6. To check that all is up and running you should run:
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
$ docker ps
```

and see

```
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

- To stop the VM run `vagrant halt` inside the vagrant folder. To start a VM from a `Stopped` or `Aborted` state, use `vagrant up`.
