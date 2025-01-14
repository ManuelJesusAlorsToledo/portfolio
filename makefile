# Construir la imagen Docker y levantarla
IMAGE_NAME = portfolio:latest
CONTAINER_NAME = portfolio_container
HOST_PORT = 80
CONTAINER_PORT = 4321
SOURCE_DIR = $(shell pwd)

build:
	@docker build -t $(IMAGE_NAME) .

# Levantar el contenedor en modo detached con volumen montado
up:
	@docker run -d -p $(HOST_PORT):$(CONTAINER_PORT) --name $(CONTAINER_NAME) -v $(SOURCE_DIR):/app $(IMAGE_NAME)

# Detener y eliminar el contenedor
down:
	@docker stop $(CONTAINER_NAME)
	@docker rm $(CONTAINER_NAME)

# Añadir bibliotecas a Astro
add-lib:
	@npx astro add $(LIB)

# Ver los logs del contenedor
logs:
	@docker logs -f $(CONTAINER_NAME)