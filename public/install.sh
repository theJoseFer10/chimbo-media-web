#!/bin/bash

# Configuración de link y nombre del repo.
REPO_URL="https://github.com/theJoseFer10/chimbo-media.git"
REPO_NAME="chimbo-media"

echo "Iniciando la instalación papus..."
echo "Clonando el repositorio..."

git clone "$REPO_URL"

echo "Repositorio clonado con éxito."
echo "Entrando al directorio..."

cd "$REPO_NAME" || { echo "Error al entrar al directorio"; exit 1; }

# Obtener la ruta absoluta dinámica
INSTALL_DIR=$(pwd)

echo "Creando entorno virtual..."
python3 -m venv venv

echo "Entorno virtual creado con éxito..."
echo "Instalando dependencias..."

source venv/bin/activate
pip install -r requirements.txt

# --- AGREGAR ALIAS AUTOMÁTICO ---
ALIAS_NAME="chimbomedia"
ALIAS_CMD="cd $INSTALL_DIR && source venv/bin/activate && python3 src/main.py"
ALIAS_LINE="alias $ALIAS_NAME='$ALIAS_CMD'"

echo "Agregando alias '$ALIAS_NAME' a ~/.bashrc..."
echo "" >> ~/.bashrc
echo "# Alias generado por instalador de chimbo-media" >> ~/.bashrc
echo "$ALIAS_LINE" >> ~/.bashrc
echo "Alias agregado correctamente."
echo "Ejecuta 'source ~/.bashrc' o reinicia la terminal para usarlo."

echo "Instalación completada con éxito... Disfruta de chimbo media :)"
echo "Nota: si quieres descargar las letras de las canciones, necesitas colocar en un archivo .env un token de la api lyricsgenius."
