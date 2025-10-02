# Docker Training Cheat Sheet

## 📖 Introduction to Docker

Docker is an open-source platform that allows developers and system administrators to build, ship, and run applications in lightweight, portable containers.

Unlike virtual machines, containers share the host operating system's kernel and isolate application processes, making them faster, smaller, and more efficient.

### With Docker, you can:
- Package applications with their dependencies into a single unit
- Run applications consistently across environments (dev, test, prod)
- Orchestrate multi-container applications with Docker Compose or Kubernetes

---

## 🔧 1. Basic Docker Info

```bash
docker version              # Show Docker version
docker info                 # Show system-wide info
docker --help               # Show help for Docker
```

## 📦 2. Images

```bash
docker images                           # List images
docker pull nginx:alpine                # Download image
docker build -t myapp:1.0 .             # Build image from Dockerfile
docker tag myapp:1.0 repo/myapp:1.0     # Tag image
docker rmi myapp:1.0                    # Remove image
```

## 📦 3. Containers

```bash
docker ps                                           # List running containers
docker ps -a                                        # List all containers (including stopped)
docker run hello-world                              # Run container from image
docker run -it ubuntu bash                          # Run interactive container
docker run -d -p 8080:80 nginx                      # Run detached container with port mapping
docker stop <container_id>                          # Stop running container
docker start <container_id>                         # Start stopped container
docker restart <container_id>                       # Restart container
docker rm <container_id>                            # Remove container
docker logs <container_id>                          # View container logs
docker exec -it <container_id> bash                 # Enter running container
```

## 📦 4. Volumes & Storage

```bash
docker volume create mydata                         # Create named volume
docker volume ls                                    # List volumes
docker run -v mydata:/data busybox                  # Mount named volume
docker run -v $(pwd):/usr/share/nginx/html nginx    # Bind mount current dir
docker volume inspect mydata                        # Inspect volume
docker volume rm mydata                             # Remove volume
```

## 🌐 5. Networking

```bash
docker network ls                           # List networks
docker network create mynet                 # Create network
docker run -d --network=mynet nginx         # Run container in custom network
docker network connect mynet container1     # Connect container to network
docker network disconnect mynet cont1       # Disconnect container from network
docker network inspect mynet                # Inspect network details
```

## 📝 6. Docker Compose

```bash
docker-compose up -d            # Start services
docker-compose ps               # List running services
docker-compose down             # Stop and remove services
docker-compose logs             # View logs of all services
docker-compose exec web bash    # Enter container via compose
```

## 🔒 7. Registry (Push/Pull)

```bash
docker login                                # Login to Docker Hub / registry
docker tag myapp:1.0 username/myapp:1.0     # Tag for registry
docker push username/myapp:1.0              # Push to registry
docker pull username/myapp:1.0              # Pull from registry
```

## 📊 8. Monitoring

```bash
docker stats                        # Live performance stats
docker top <container_id>           # Show processes inside container
docker inspect <container_id>       # Detailed container info
```

## 🧹 9. Cleanup

```bash
docker system df                    # Show disk usage
docker system prune                 # Remove stopped containers, unused networks, dangling images
docker container prune              # Remove all stopped containers
docker image prune                  # Remove unused images
docker volume prune                 # Remove unused volumes
```

## ⚡ 10. Resource Limits

```bash
docker run -d --name web --cpus="1.0" --memory="512m" nginx
```

---

**Happy Dockering! 🐳**
