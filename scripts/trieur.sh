#!/bin/bash

TARGET=$1

# 1. Vérification : l'utilisateur a-t-il oublié le paramètre ?
if [ -z "$TARGET" ]; then
    echo "Usage: $0 <chemin_du_dossier>"
    exit 1
fi

# 2. Vérification : le dossier existe-t-il vraiment ?
if [ ! -d "$TARGET" ]; then
    echo "Erreur : Le dossier $TARGET n'existe pas."
    exit 1
fi

for FICHIER in "$TARGET"/*; do
  echo $FICHIER
  if [ -f "$FICHIER" ]; then
    EXTENSION="${FICHIER##*.}"
    case "$EXTENSION" in
      jpg|png|gif)
          DOSSIER="IMAGES"
          ;;
      pdf|txt|docx)
          DOSSIER="DOCUMENTS"
          ;;
      sh|py|js)
          DOSSIER="SCRIPTS"
          ;;
      mp3|aaa|wav)
          DOSSIER="MUSIC"
          ;;
      mp4|avi|mkv|mpeg)
          DOSSIER="VIDEOS"
          ;;
      *)
          DOSSIER="AUTRES"
          ;;
    esac
    OUTPUT="$TARGET/$DOSSIER"
    mkdir -p "$OUTPUT"
    mv "$FICHIER"  "$OUTPUT/"
    echo "Rangement de $FICHIER dans $DOSSIER"
  fi
done

echo "Triage terminé !"
