#!/bin/bash

install_dir=$(dirname "$0")
. ${install_dir}/install-helm.config
yaml_dir="${install_dir}/yaml"

# set env
if [[ -z ${imageRegistry} ]]; then
    imageRegistry=docker.io
else
    imageRegistry=${imageRegistry}
fi

if [[ -z ${helmApiServerVersion} ]]; then
    helmApiServerVersion=0.0.0
else
    helmApiServerVersion=${helmApiServerVersion}
fi

echo "================== get console host =================="
export consoleHost=$(kubectl get ingressroute -n api-gateway-system console -o jsonpath='{@.spec.routes[0].match}' | awk '{print $6}' | cut -d'`' -f2 | sed 's/console/helm/g')

# change parameters
sed -i "s|{imageRegistry}|${imageRegistry}|g" ${yaml_dir}/deploy.yaml
sed -i "s|{helmApiServerVersion}|${helmApiServerVersion}|g" ${yaml_dir}/deploy.yaml
sed -i "s|{consoleHost}|${consoleHost}|g" ${install_dir}/ingress.yaml

# install
kubectl apply -f ${yaml_dir}/pvc.yaml 
kubectl apply -f ${yaml_dir}/deploy.yaml
kubectl apply -f ${yaml_dir}/ingress.yaml