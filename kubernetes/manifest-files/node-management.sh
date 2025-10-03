# Get nodes
kubectl get nodes

# Describe node
kubectl describe node <node-name>

# View node resources
kubectl top nodes

# Label node
kubectl label nodes <node-name> disktype=ssd

# Taint node (prevents scheduling)
kubectl taint nodes <node-name> key=value:NoSchedule

# Cordon node (mark unschedulable)
kubectl cordon <node-name>

# Drain node (evict pods)
kubectl drain <node-name> --ignore-daemonsets

# Uncordon node
kubectl uncordon <node-name>

# Remove taint
kubectl taint nodes <node-name> key=value:NoSchedule-