FROM alpine:3.19

RUN apk add --no-cache bash

# On définit le dossier de base
WORKDIR /app

# On copie les dossiers (Docker créera /app/scripts et /app/config)
COPY scripts/ app/scripts/
COPY config/ app/config/

# On rend les scripts exécutables (chemin relatif au WORKDIR)
RUN chmod +x app/scripts/*.sh

# Commande de lancement
CMD ["/bin/bash", "/app/scripts/trieur.sh", "--help"]

