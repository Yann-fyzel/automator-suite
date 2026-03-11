#!/bin/bash

OUTPUT_DIR="/mnt/a/WSL/Ubuntu24/Reports"
REPORT_FILE="$OUTPUT_DIR/sante_$(hostname)_$(date +%Y%m%d).log"

mkdir -p "$OUTPUT_DIR"

echo "--- RAPPORT DE SANTE SYSTEME ---" > "$REPORT_FILE"
echo "Date : $(date)" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "[1. UTILISATION RAM]" >> "$REPORT_FILE"
free -h >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "[2. ESPACE DISQUE]" >> "$REPORT_FILE"
df -h / >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "[3. UTILISATEURS CONNECTÉS]" >> "$REPORT_FILE"
who >> "$REPORT_FILE"

echo "Le rapport a été généré ici : $REPORT_FILE"
