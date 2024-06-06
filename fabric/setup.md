# Setup guide for fabric running on docker

This will enable you to create a environment running locally ollama and fabric on separate docker containers.

The docker container running fabric will connect to another container running ollama.

### Set up ollama

Run this to set up a new docker container called ollama1.

```
docker run -d --gpus=all `
    -v "d:/exposed_to_docker/ollama:/root/.ollama" `
    -p 11667:11434 `
    --name ollama1 ollama/ollama
```

Once this is running log into that container.

```
docker start ollama1
```

```
docker exec -it ollama1 /bin/bash
```

Once there we need to pull some models.

```
ollama pull llama3
```

This is it and we are ready to go here.

### Set up fabric

First need to build the image.

```
docker build https://github.com/jakub-deka/docker_repos.git#main:fabric -t jakub-deka/fabric
```

Then

```
docker run -d -i --add-host=host.docker.internal:host-gateway --name fabric_host jakub-deka/fabric
```

Optionally we need to get this running

```
docker start fabric_host
```

Then log into the container

```
docker exec ollama1 /bin/bash
```

Once there we need to set up fabric

```
fabric --setup
```

Once this is done you can either use `fabric` command directly or use alias fab. For example

```
echo "about wood" | fab -sp write_essay
```