# Create namespace
kubectl create namespace dev-env

# Create namespace from YAML
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Namespace
metadata:
  name: prod-env
  labels:
    environment: production
EOF

# List namespaces
kubectl get namespaces

# Create resource in specific namespace
kubectl run nginx --image=nginx -n dev-env

# Get resources from namespace
kubectl get pods -n dev-env

# Switch default namespace
kubectl config set-context --current --namespace=dev-env

# Delete namespace (deletes all resources inside)
kubectl delete namespace dev-env