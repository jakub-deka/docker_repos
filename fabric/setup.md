# Setup guide for fabric running on docker

This will enable you to create a environment running locally ollama and fabric on separate docker containers.

The docker container running fabric will connect to another container running ollama.

### Set up ollama

Run this to set up a new docker container called ollama1.

```PowerShell
docker run -d --gpus=all `
    -v "d:/exposed_to_docker/ollama:/root/.ollama" `
    -p 11667:11434 `
    --name ollama1 ollama/ollama
```

Once this is running log into that container.

```PowerShell
docker start ollama1
```

```PowerShell
docker exec -it ollama1 /bin/bash
```

Once there we need to pull some models.

```bash
ollama pull llama3
```

This is it and we are ready to go here.

### Set up fabric

First need to build the image.

```PowerShell
docker build https://github.com/jakub-deka/docker_repos.git#main:fabric -t jakub-deka/fabric
```

Then

```PowerShell
docker run -d -i --add-host=host.docker.internal:host-gateway --name fabric_host jakub-deka/fabric
```

Optionally we need to get this running

```PowerShell
docker start fabric_host
```

Then log into the container

```PowerShell
docker exec ollama1 /bin/bash
```

Once there we need to set up fabric

```bash
fabric --setup
```

Once this is done you can either use `fabric` command directly or use alias fab. For example

```bash
echo "about wood" | fab -sp write_essay
```