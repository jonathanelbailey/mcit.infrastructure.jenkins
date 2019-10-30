#! /bin/sh

name=jenkins
namespace=$name
helm_chart=stable/${name}
svc_name=service/${name}
ip_address=$1
port=8080
microk8s.helm install --name $name --namespace $namespace --set $helm_chart
printf $(microk8s.kubectl get secret --namespace $namespace $name -o jsonpath="{.data.${name}-admin-password}" | base64 --decode);echo
# microk8s.kubectl port-forward $svc_name -n $name --address $ip_address 8080 &