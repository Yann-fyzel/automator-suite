FROM alpine:3.19

RUN apk add --no-cache bash

# On définit le dossier de base
WORKDIR /app

# On copie les dossiers (Docker créera /app/scripts et /app/config)
COPY scripts/ ./scripts/
COPY config/ ./config/

# On rend les scripts exécutables (chemin relatif au WORKDIR)
RUN chmod +x ./scripts/*.sh


ENTRYPOINT ["/bin/bash", "/app/scripts/trieur.sh"]

# Commande de lancement
CMD ["--help"]

