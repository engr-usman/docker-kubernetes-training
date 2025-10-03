# Kubernetes Commands Cheat Sheet

A comprehensive guide to essential Kubernetes (kubectl) commands for daily operations.

---

## 📋 Table of Contents
1. [Cluster Information](#cluster-information)
2. [Context & Configuration](#context--configuration)
3. [Pods](#pods)
4. [Deployments](#deployments)
5. [Services](#services)
6. [Namespaces](#namespaces)
7. [ConfigMaps & Secrets](#configmaps--secrets)
8. [Volumes](#volumes)
9. [ReplicaSets & ReplicationControllers](#replicasets--replicationcontrollers)
10. [Jobs & CronJobs](#jobs--cronjobs)
11. [Ingress](#ingress)
12. [Network Policies](#network-policies)
13. [RBAC](#rbac-role-based-access-control)
14. [Resource Management](#resource-management)
15. [Nodes](#nodes)
16. [Logs & Debugging](#logs--debugging)
17. [Scaling & Autoscaling](#scaling--autoscaling)
18. [Labels & Selectors](#labels--selectors)
19. [Rollouts & Rollbacks](#rollouts--rollbacks)
20. [Advanced Operations](#advanced-operations)

---

## 🔧 Cluster Information

```bash
# Display cluster information
kubectl cluster-info

# Display version information
kubectl version

# Get cluster configuration
kubectl config view

# List all API resources
kubectl api-resources

# List all API versions
kubectl api-versions

# Check cluster health
kubectl get componentstatuses
kubectl get cs
```

---

## ⚙️ Context & Configuration

```bash
# View current context
kubectl config current-context

# List all contexts
kubectl config get-contexts

# Switch context
kubectl config use-context <context-name>

# Set default namespace for context
kubectl config set-context --current --namespace=<namespace>

# Create a new context
kubectl config set-context <context-name> --cluster=<cluster> --user=<user> --namespace=<namespace>

# Delete a context
kubectl config delete-context <context-name>

# View kubeconfig
kubectl config view

# Set a cluster entry
kubectl config set-cluster <cluster-name> --server=<server-url>

# Set credentials
kubectl config set-credentials <user-name> --token=<token>
```

---

## 🐳 Pods

```bash
# List all pods in current namespace
kubectl get pods
kubectl get po

# List all pods in all namespaces
kubectl get pods --all-namespaces
kubectl get pods -A

# List pods with more details
kubectl get pods -o wide

# Describe a specific pod
kubectl describe pod <pod-name>

# Create a pod from YAML file
kubectl apply -f pod.yaml

# Create a pod imperatively
kubectl run <pod-name> --image=<image-name>

# Create pod with specific port
kubectl run <pod-name> --image=<image-name> --port=8080

# Create pod with environment variables
kubectl run <pod-name> --image=<image-name> --env="VAR=value"

# Delete a pod
kubectl delete pod <pod-name>

# Delete pod immediately (force)
kubectl delete pod <pod-name> --grace-period=0 --force

# Delete all pods in namespace
kubectl delete pods --all

# Get pod logs
kubectl logs <pod-name>

# Get logs from specific container in pod
kubectl logs <pod-name> -c <container-name>

# Stream logs (follow)
kubectl logs -f <pod-name>

# Get previous container logs (crashed container)
kubectl logs <pod-name> --previous

# Execute command in pod
kubectl exec <pod-name> -- <command>

# Interactive shell in pod
kubectl exec -it <pod-name> -- /bin/bash
kubectl exec -it <pod-name> -- /bin/sh

# Execute command in specific container
kubectl exec -it <pod-name> -c <container-name> -- /bin/bash

# Copy files to pod
kubectl cp <local-path> <pod-name>:<pod-path>

# Copy files from pod
kubectl cp <pod-name>:<pod-path> <local-path>

# Port forward to pod
kubectl port-forward <pod-name> <local-port>:<pod-port>

# Get pod YAML
kubectl get pod <pod-name> -o yaml

# Get pod JSON
kubectl get pod <pod-name> -o json

# Watch pods
kubectl get pods -w

# Get pods with labels
kubectl get pods --show-labels

# Get pods by label selector
kubectl get pods -l app=nginx

# Get pods sorted by creation time
kubectl get pods --sort-by=.metadata.creationTimestamp
```

---

## 🚀 Deployments

```bash
# List all deployments
kubectl get deployments
kubectl get deploy

# Describe deployment
kubectl describe deployment <deployment-name>

# Create deployment
kubectl create deployment <name> --image=<image>

# Create deployment with replicas
kubectl create deployment <name> --image=<image> --replicas=3

# Create deployment from YAML
kubectl apply -f deployment.yaml

# Update deployment image
kubectl set image deployment/<deployment-name> <container-name>=<new-image>

# Edit deployment
kubectl edit deployment <deployment-name>

# Delete deployment
kubectl delete deployment <deployment-name>

# Scale deployment
kubectl scale deployment <deployment-name> --replicas=5

# Autoscale deployment
kubectl autoscale deployment <deployment-name> --min=2 --max=10 --cpu-percent=80

# Get deployment rollout status
kubectl rollout status deployment/<deployment-name>

# Get deployment rollout history
kubectl rollout history deployment/<deployment-name>

# Rollback to previous version
kubectl rollout undo deployment/<deployment-name>

# Rollback to specific revision
kubectl rollout undo deployment/<deployment-name> --to-revision=2

# Pause deployment rollout
kubectl rollout pause deployment/<deployment-name>

# Resume deployment rollout
kubectl rollout resume deployment/<deployment-name>

# Restart deployment (recreate all pods)
kubectl rollout restart deployment/<deployment-name>

# Get deployment YAML
kubectl get deployment <deployment-name> -o yaml

# Export deployment without cluster-specific info
kubectl get deployment <deployment-name> -o yaml --export
```

---

## 🌐 Services

```bash
# List all services
kubectl get services
kubectl get svc

# Describe service
kubectl describe service <service-name>

# Create ClusterIP service
kubectl create service clusterip <service-name> --tcp=80:8080

# Create NodePort service
kubectl create service nodeport <service-name> --tcp=80:8080 --node-port=30080

# Create LoadBalancer service
kubectl create service loadbalancer <service-name> --tcp=80:8080

# Expose deployment as service
kubectl expose deployment <deployment-name> --port=80 --target-port=8080

# Expose deployment as NodePort
kubectl expose deployment <deployment-name> --type=NodePort --port=80

# Expose deployment as LoadBalancer
kubectl expose deployment <deployment-name> --type=LoadBalancer --port=80

# Create service from YAML
kubectl apply -f service.yaml

# Delete service
kubectl delete service <service-name>

# Get service endpoints
kubectl get endpoints <service-name>

# Get service YAML
kubectl get service <service-name> -o yaml

# Port forward to service
kubectl port-forward service/<service-name> <local-port>:<service-port>
```

---

## 📦 Namespaces

```bash
# List all namespaces
kubectl get namespaces
kubectl get ns

# Describe namespace
kubectl describe namespace <namespace-name>

# Create namespace
kubectl create namespace <namespace-name>

# Create namespace from YAML
kubectl apply -f namespace.yaml

# Delete namespace
kubectl delete namespace <namespace-name>

# Get resources in specific namespace
kubectl get all -n <namespace-name>

# Get all resources in all namespaces
kubectl get all --all-namespaces
kubectl get all -A

# Set default namespace for current context
kubectl config set-context --current --namespace=<namespace-name>

# Create resource in specific namespace
kubectl apply -f resource.yaml -n <namespace-name>

# Get namespace resource quota
kubectl get resourcequota -n <namespace-name>

# Get namespace limit ranges
kubectl get limitrange -n <namespace-name>
```

---

## 🔐 ConfigMaps & Secrets

### ConfigMaps

```bash
# List all configmaps
kubectl get configmaps
kubectl get cm

# Describe configmap
kubectl describe configmap <configmap-name>

# Create configmap from literal values
kubectl create configmap <name> --from-literal=key1=value1 --from-literal=key2=value2

# Create configmap from file
kubectl create configmap <name> --from-file=<file-path>

# Create configmap from directory
kubectl create configmap <name> --from-file=<directory-path>

# Create configmap from env file
kubectl create configmap <name> --from-env-file=<env-file>

# Create configmap from YAML
kubectl apply -f configmap.yaml

# Delete configmap
kubectl delete configmap <configmap-name>

# Get configmap data
kubectl get configmap <configmap-name> -o yaml

# Edit configmap
kubectl edit configmap <configmap-name>
```

### Secrets

```bash
# List all secrets
kubectl get secrets

# Describe secret
kubectl describe secret <secret-name>

# Create generic secret from literal
kubectl create secret generic <name> --from-literal=username=admin --from-literal=password=secret

# Create secret from file
kubectl create secret generic <name> --from-file=<file-path>

# Create TLS secret
kubectl create secret tls <name> --cert=<cert-file> --key=<key-file>

# Create docker-registry secret
kubectl create secret docker-registry <name> \
  --docker-server=<server> \
  --docker-username=<username> \
  --docker-password=<password> \
  --docker-email=<email>

# Create secret from YAML
kubectl apply -f secret.yaml

# Delete secret
kubectl delete secret <secret-name>

# Get secret data (base64 encoded)
kubectl get secret <secret-name> -o yaml

# Decode secret value
kubectl get secret <secret-name> -o jsonpath='{.data.password}' | base64 -d

# Edit secret
kubectl edit secret <secret-name>
```

---

## 💾 Volumes

### PersistentVolumes (PV)

```bash
# List all persistent volumes
kubectl get persistentvolumes
kubectl get pv

# Describe persistent volume
kubectl describe pv <pv-name>

# Create PV from YAML
kubectl apply -f pv.yaml

# Delete persistent volume
kubectl delete pv <pv-name>

# Get PV YAML
kubectl get pv <pv-name> -o yaml
```

### PersistentVolumeClaims (PVC)

```bash
# List all persistent volume claims
kubectl get persistentvolumeclaims
kubectl get pvc

# List PVCs in specific namespace
kubectl get pvc -n <namespace>

# Describe PVC
kubectl describe pvc <pvc-name>

# Create PVC from YAML
kubectl apply -f pvc.yaml

# Delete PVC
kubectl delete pvc <pvc-name>

# Get PVC YAML
kubectl get pvc <pvc-name> -o yaml
```

### StorageClass

```bash
# List all storage classes
kubectl get storageclass
kubectl get sc

# Describe storage class
kubectl describe sc <storageclass-name>

# Create storage class from YAML
kubectl apply -f storageclass.yaml

# Delete storage class
kubectl delete sc <storageclass-name>

# Set default storage class
kubectl patch storageclass <storageclass-name> -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

---

## 🔄 ReplicaSets & ReplicationControllers

### ReplicaSets

```bash
# List all replicasets
kubectl get replicasets
kubectl get rs

# Describe replicaset
kubectl describe rs <replicaset-name>

# Create replicaset from YAML
kubectl apply -f replicaset.yaml

# Scale replicaset
kubectl scale rs <replicaset-name> --replicas=5

# Delete replicaset
kubectl delete rs <replicaset-name>

# Delete replicaset but keep pods
kubectl delete rs <replicaset-name> --cascade=orphan

# Get replicaset YAML
kubectl get rs <replicaset-name> -o yaml
```

### ReplicationControllers

```bash
# List all replication controllers
kubectl get replicationcontrollers
kubectl get rc

# Describe replication controller
kubectl describe rc <rc-name>

# Scale replication controller
kubectl scale rc <rc-name> --replicas=5

# Delete replication controller
kubectl delete rc <rc-name>
```

---

## ⏰ Jobs & CronJobs

### Jobs

```bash
# List all jobs
kubectl get jobs

# Describe job
kubectl describe job <job-name>

# Create job from YAML
kubectl apply -f job.yaml

# Create job imperatively
kubectl create job <job-name> --image=<image>

# Delete job
kubectl delete job <job-name>

# Get job logs
kubectl logs job/<job-name>

# Get job YAML
kubectl get job <job-name> -o yaml
```

### CronJobs

```bash
# List all cronjobs
kubectl get cronjobs
kubectl get cj

# Describe cronjob
kubectl describe cronjob <cronjob-name>

# Create cronjob from YAML
kubectl apply -f cronjob.yaml

# Create cronjob imperatively
kubectl create cronjob <name> --image=<image> --schedule="*/5 * * * *" -- <command>

# Suspend cronjob
kubectl patch cronjob <cronjob-name> -p '{"spec":{"suspend":true}}'

# Resume cronjob
kubectl patch cronjob <cronjob-name> -p '{"spec":{"suspend":false}}'

# Manually trigger cronjob
kubectl create job <job-name> --from=cronjob/<cronjob-name>

# Delete cronjob
kubectl delete cronjob <cronjob-name>

# Get cronjob YAML
kubectl get cronjob <cronjob-name> -o yaml
```

---

## 🌍 Ingress

```bash
# List all ingresses
kubectl get ingress
kubectl get ing

# Describe ingress
kubectl describe ingress <ingress-name>

# Create ingress from YAML
kubectl apply -f ingress.yaml

# Delete ingress
kubectl delete ingress <ingress-name>

# Get ingress YAML
kubectl get ingress <ingress-name> -o yaml

# Edit ingress
kubectl edit ingress <ingress-name>

# List ingress classes
kubectl get ingressclass

# Describe ingress class
kubectl describe ingressclass <ingressclass-name>
```

---

## 🔒 Network Policies

```bash
# List all network policies
kubectl get networkpolicies
kubectl get netpol

# Describe network policy
kubectl describe networkpolicy <policy-name>

# Create network policy from YAML
kubectl apply -f networkpolicy.yaml

# Delete network policy
kubectl delete networkpolicy <policy-name>

# Get network policy YAML
kubectl get networkpolicy <policy-name> -o yaml

# List all network policies in all namespaces
kubectl get networkpolicies --all-namespaces
```

---

## 👤 RBAC (Role-Based Access Control)

### ServiceAccounts

```bash
# List all service accounts
kubectl get serviceaccounts
kubectl get sa

# Describe service account
kubectl describe sa <sa-name>

# Create service account
kubectl create serviceaccount <sa-name>

# Delete service account
kubectl delete sa <sa-name>

# Get service account token
kubectl get secret $(kubectl get sa <sa-name> -o jsonpath='{.secrets[0].name}') -o jsonpath='{.data.token}' | base64 -d
```

### Roles

```bash
# List all roles
kubectl get roles

# Describe role
kubectl describe role <role-name>

# Create role from YAML
kubectl apply -f role.yaml

# Create role imperatively
kubectl create role <role-name> --verb=get,list --resource=pods

# Delete role
kubectl delete role <role-name>

# Get role YAML
kubectl get role <role-name> -o yaml
```

### RoleBindings

```bash
# List all role bindings
kubectl get rolebindings

# Describe role binding
kubectl describe rolebinding <binding-name>

# Create role binding
kubectl create rolebinding <binding-name> --role=<role-name> --serviceaccount=<namespace>:<sa-name>

# Create role binding for user
kubectl create rolebinding <binding-name> --role=<role-name> --user=<username>

# Delete role binding
kubectl delete rolebinding <binding-name>
```

### ClusterRoles

```bash
# List all cluster roles
kubectl get clusterroles

# Describe cluster role
kubectl describe clusterrole <clusterrole-name>

# Create cluster role from YAML
kubectl apply -f clusterrole.yaml

# Create cluster role imperatively
kubectl create clusterrole <name> --verb=get,list --resource=pods

# Delete cluster role
kubectl delete clusterrole <clusterrole-name>
```

### ClusterRoleBindings

```bash
# List all cluster role bindings
kubectl get clusterrolebindings

# Describe cluster role binding
kubectl describe clusterrolebinding <binding-name>

# Create cluster role binding
kubectl create clusterrolebinding <binding-name> --clusterrole=<clusterrole-name> --serviceaccount=<namespace>:<sa-name>

# Delete cluster role binding
kubectl delete clusterrolebinding <binding-name>
```

### Authorization

```bash
# Check if you can perform action
kubectl auth can-i create pods

# Check for specific namespace
kubectl auth can-i create pods -n <namespace>

# Check as different user
kubectl auth can-i create pods --as=<username>

# Check as service account
kubectl auth can-i create pods --as=system:serviceaccount:<namespace>:<sa-name>

# List all permissions for user
kubectl auth can-i --list

# List all permissions in namespace
kubectl auth can-i --list -n <namespace>
```

---

## 📊 Resource Management

### ResourceQuota

```bash
# List all resource quotas
kubectl get resourcequotas
kubectl get quota

# Describe resource quota
kubectl describe quota <quota-name>

# Create resource quota from YAML
kubectl apply -f resourcequota.yaml

# Delete resource quota
kubectl delete quota <quota-name>

# Get resource quota YAML
kubectl get quota <quota-name> -o yaml
```

### LimitRange

```bash
# List all limit ranges
kubectl get limitranges
kubectl get limits

# Describe limit range
kubectl describe limitrange <limitrange-name>

# Create limit range from YAML
kubectl apply -f limitrange.yaml

# Delete limit range
kubectl delete limitrange <limitrange-name>

# Get limit range YAML
kubectl get limitrange <limitrange-name> -o yaml
```

---

## 🖥️ Nodes

```bash
# List all nodes
kubectl get nodes

# List nodes with more details
kubectl get nodes -o wide

# Describe node
kubectl describe node <node-name>

# Get node YAML
kubectl get node <node-name> -o yaml

# Label node
kubectl label nodes <node-name> <label-key>=<label-value>

# Remove label from node
kubectl label nodes <node-name> <label-key>-

# Taint node
kubectl taint nodes <node-name> key=value:NoSchedule

# Remove taint from node
kubectl taint nodes <node-name> key=value:NoSchedule-

# Cordon node (mark as unschedulable)
kubectl cordon <node-name>

# Uncordon node (mark as schedulable)
kubectl uncordon <node-name>

# Drain node (evict all pods)
kubectl drain <node-name> --ignore-daemonsets --delete-emptydir-data

# Get node resource usage (requires metrics-server)
kubectl top nodes

# Get node conditions
kubectl get nodes -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.conditions[?(@.type=="Ready")].status}{"\n"}{end}'
```

---

## 📝 Logs & Debugging

```bash
# Get pod logs
kubectl logs <pod-name>

# Get logs from specific container
kubectl logs <pod-name> -c <container-name>

# Stream logs (follow)
kubectl logs -f <pod-name>

# Get logs with timestamps
kubectl logs <pod-name> --timestamps

# Get logs from previous container (crashed)
kubectl logs <pod-name> --previous

# Get logs for last N lines
kubectl logs <pod-name> --tail=100

# Get logs since duration
kubectl logs <pod-name> --since=1h

# Get logs for all containers in pod
kubectl logs <pod-name> --all-containers=true

# Get events
kubectl get events

# Get events sorted by timestamp
kubectl get events --sort-by=.metadata.creationTimestamp

# Get events for specific object
kubectl get events --field-selector involvedObject.name=<pod-name>

# Describe pod for troubleshooting
kubectl describe pod <pod-name>

# Check pod status
kubectl get pod <pod-name> -o jsonpath='{.status.phase}'

# Get pod container statuses
kubectl get pod <pod-name> -o jsonpath='{.status.containerStatuses[*].state}'

# Run debug container in pod (ephemeral containers)
kubectl debug <pod-name> -it --image=busybox

# Create debug pod with node's filesystem
kubectl debug node/<node-name> -it --image=busybox

# Get resource usage (requires metrics-server)
kubectl top pods
kubectl top nodes

# Port forward for debugging
kubectl port-forward <pod-name> <local-port>:<pod-port>

# Proxy to Kubernetes API
kubectl proxy

# Get API server address
kubectl cluster-info
```

---

## 📈 Scaling & Autoscaling

### Manual Scaling

```bash
# Scale deployment
kubectl scale deployment <deployment-name> --replicas=5

# Scale replicaset
kubectl scale rs <replicaset-name> --replicas=3

# Scale statefulset
kubectl scale statefulset <statefulset-name> --replicas=3

# Scale with condition
kubectl scale deployment <deployment-name> --replicas=5 --current-replicas=3
```

### HorizontalPodAutoscaler (HPA)

```bash
# List all HPAs
kubectl get hpa

# Describe HPA
kubectl describe hpa <hpa-name>

# Create HPA (CPU based)
kubectl autoscale deployment <deployment-name> --min=2 --max=10 --cpu-percent=80

# Create HPA from YAML
kubectl apply -f hpa.yaml

# Delete HPA
kubectl delete hpa <hpa-name>

# Get HPA YAML
kubectl get hpa <hpa-name> -o yaml

# Edit HPA
kubectl edit hpa <hpa-name>
```

### VerticalPodAutoscaler (VPA)

```bash
# List all VPAs
kubectl get vpa

# Describe VPA
kubectl describe vpa <vpa-name>

# Create VPA from YAML
kubectl apply -f vpa.yaml

# Delete VPA
kubectl delete vpa <vpa-name>

# Get VPA recommendations
kubectl get vpa <vpa-name> -o jsonpath='{.status.recommendation}'
```

---

## 🏷️ Labels & Selectors

```bash
# Show labels for all pods
kubectl get pods --show-labels

# Add label to resource
kubectl label pod <pod-name> env=prod

# Update existing label
kubectl label pod <pod-name> env=dev --overwrite

# Remove label
kubectl label pod <pod-name> env-

# Get resources by label
kubectl get pods -l env=prod

# Get resources with multiple labels
kubectl get pods -l 'env=prod,tier=frontend'

# Get resources with label existence
kubectl get pods -l env

# Get resources without label
kubectl get pods -l '!env'

# Get resources with label in set
kubectl get pods -l 'env in (prod,dev)'

# Get resources with label not in set
kubectl get pods -l 'env notin (test)'

# Add label to all pods
kubectl label pods --all status=active

# Label nodes
kubectl label nodes <node-name> disktype=ssd

# Show node labels
kubectl get nodes --show-labels

# Select resources by annotation
kubectl get pods -o json | jq '.items[] | select(.metadata.annotations.key=="value")'
```

---

## 🔄 Rollouts & Rollbacks

```bash
# Check rollout status
kubectl rollout status deployment/<deployment-name>

# View rollout history
kubectl rollout history deployment/<deployment-name>

# View specific revision
kubectl rollout history deployment/<deployment-name> --revision=2

# Undo rollout (rollback to previous)
kubectl rollout undo deployment/<deployment-name>

# Rollback to specific revision
kubectl rollout undo deployment/<deployment-name> --to-revision=2

# Pause rollout
kubectl rollout pause deployment/<deployment-name>

# Resume rollout
kubectl rollout resume deployment/<deployment-name>

# Restart deployment (rolling restart)
kubectl rollout restart deployment/<deployment-name>

# Restart daemonset
kubectl rollout restart daemonset/<daemonset-name>

# Restart statefulset
kubectl rollout restart statefulset/<statefulset-name>
```

---

## 🚀 Advanced Operations

### Resource Management

```bash
# Apply configuration from file
kubectl apply -f <file.yaml>

# Apply from URL
kubectl apply -f https://example.com/config.yaml

# Apply all files in directory
kubectl apply -f <directory>/

# Apply with recursive directory
kubectl apply -f <directory>/ -R

# Delete resources from file
kubectl delete -f <file.yaml>

# Replace resource (delete and recreate)
kubectl replace -f <file.yaml>

# Replace with force (delete and recreate immediately)
kubectl replace --force -f <file.yaml>

# Patch resource
kubectl patch deployment <deployment-name> -p '{"spec":{"replicas":5}}'

# Patch with merge strategy
kubectl patch deployment <deployment-name> --type merge -p '{"spec":{"replicas":5}}'

# Patch with JSON patch
kubectl patch deployment <deployment-name> --type json -p '[{"op":"replace","path":"/spec/replicas","value":5}]'

# Edit resource in editor
kubectl edit deployment <deployment-name>

# Set image
kubectl set image deployment/<deployment-name> <container-name>=<new-image>

# Set resources
kubectl set resources deployment <deployment-name> -c=<container> --limits=cpu=200m,memory=512Mi

# Set environment variable
kubectl set env deployment/<deployment-name> ENV_VAR=value

# Set service account
kubectl set serviceaccount deployment <deployment-name> <sa-name>
```

### Output Formatting

```bash
# Output as YAML
kubectl get pod <pod-name> -o yaml

# Output as JSON
kubectl get pod <pod-name> -o json

# Output as JSON with jq processing
kubectl get pods -o json | jq '.items[].metadata.name'

# Output with custom columns
kubectl get pods -o custom-columns=NAME:.metadata.name,STATUS:.status.phase

# Output with JSONPath
kubectl get pods -o jsonpath='{.items[*].metadata.name}'

# Output as wide (more details)
kubectl get pods -o wide

# Output as name only
kubectl get pods -o name

# Output with specific JSONPath and loop
kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.podIP}{"\n"}{end}'
```

### Field Selectors

```bash
# Get pods by status
kubectl get pods --field-selector status.phase=Running

# Get pods by node
kubectl get pods --field-selector spec.nodeName=<node-name>

# Multiple field selectors
kubectl get pods --field-selector status.phase=Running,spec.nodeName=<node-name>

# Get services by type
kubectl get services --field-selector spec.type=LoadBalancer

# Get events for specific object
kubectl get events --field-selector involvedObject.name=<pod-name>
```

### Resource Types

```bash
# Get all resource types
kubectl api-resources

# Get namespaced resources
kubectl api-resources --namespaced=true

# Get non-namespaced resources
kubectl api-resources --namespaced=false

# Get resources with short names
kubectl api-resources -o name

# Get resources in specific API group
kubectl api-resources --api-group=apps

# Explain resource
kubectl explain pod

# Explain specific field
kubectl explain pod.spec.containers

# Explain with recursive
kubectl explain pod --recursive
```

### Diff & Dry Run

```bash
# Show diff before applying
kubectl diff -f <file.yaml>

# Dry run (client-side)
kubectl apply -f <file.yaml> --dry-run=client

# Dry run (server-side)
kubectl apply -f <file.yaml> --dry-run=server

# Create resource with dry run
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml

# Validate YAML without creating
kubectl create -f <file.yaml> --dry-run=client --validate=true
```

### Wait & Watch

```bash
# Wait for condition
kubectl wait --for=condition=ready pod/<pod-name>

# Wait for deletion
kubectl wait --for=delete pod/<pod-name> --timeout=60s

# Wait for deployment
kubectl wait --for=condition=available deployment/<deployment-name>

# Watch resources
kubectl get pods -w

# Watch with timestamps
kubectl get pods -w --output-watch-events
```

### Plugin Management

```bash
# List installed plugins
kubectl plugin list

# Install krew (plugin manager)
# Follow instructions at https://krew.sigs.k8s.io/

# Install plugin via krew
kubectl krew install <plugin-name>

# Update plugins
kubectl krew update

# List available plugins
kubectl krew search
```

---

## 🔍 Quick Reference

### Common Abbreviations

```bash
po          # pods
deploy      # deployments
rs          # replicasets
rc          # replicationcontrollers
svc         # services
ns          # namespaces
cm          # configmaps
sa          # serviceaccounts
ing         # ingresses
netpol      # networkpolicies
pv          # persistentvolumes
pvc         # persistentvolumeclaims
sc          # storageclasses
```

### Useful Aliases

```bash
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kdel='kubectl delete'
alias kl='kubectl logs'
alias kex='kubectl exec -it'
alias ka='kubectl apply -f'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgn='kubectl get nodes'
```

---

## 💡 Pro Tips

```bash
# Generate YAML template
kubectl create deployment nginx --image=nginx --dry-run=client -o yaml > deployment.yaml

# Quick pod for testing
kubectl run test --image=busybox -it --rm -- sh

# Get all resources in namespace
kubectl get all -n <namespace>

# Force delete stuck pod
kubectl delete pod <pod-name> --grace-period=0 --force

# Copy file from pod
kubectl cp <namespace>/<pod>:/path/to/file ./local-file

# Create secret from file quickly
kubectl create secret generic my-secret --from-file=./secret.txt

# Get resource consumption
kubectl top pods --sort-by=memory
kubectl top pods --sort-by=cpu

# Debug networking
kubectl run curl-test --image=curlimages/curl -it --rm -- sh

# Check resource requests/limits
kubectl describe nodes | grep -A 5 "Allocated resources"

# Find pods on specific node
kubectl get pods --all-namespaces -o wide --field-selector spec.nodeName=<node-name>
```

---

## 📚 Additional Resources

- [Official Kubernetes Documentation](https://kubernetes.io/docs/)
- [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
- [Kubernetes API Reference](https://kubernetes.io/docs/reference/kubernetes-api/)

---

**Happy