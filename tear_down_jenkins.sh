#! /bin/sh

name=jenkins

microk8s.helm delete $name --purge