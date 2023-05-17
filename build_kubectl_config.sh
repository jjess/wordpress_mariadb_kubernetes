#!/bin/sh

# API server address
server=https://192.168.56.102:6443
# the name of the secret containing the service account token goes here
name=jenkins

ca=$(kubectl get secret/$name -o jsonpath='{.data.ca\.crt}')
token=$(kubectl get secret/$name -o jsonpath='{.data.token}' | base64 --decode)
namespace=$(kubectl get secret/$name -o jsonpath='{.data.namespace}' | base64 --decode)

echo "
apiVersion: v1
kind: Config
clusters:
- name: default-cluster
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: default-context
  context:
    cluster: prod-cluster
    namespace: ${namespace}
    user: jenkins
current-context: default-context
users:
- name: jenkins
  user:
    token: ${token}
" > config

echo "copy 'config' file to jenkins's home (/var/lib/jenkins/kube/.config)"

