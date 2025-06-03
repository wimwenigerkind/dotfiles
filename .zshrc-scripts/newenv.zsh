# Usage:
#   newenv                          → .env → ~/environments/<dirname>.env
#   newenv .env.test                → .env.test → ~/environments/<dirname>.env
#   newenv .env.test prod.env       → .env.test → ~/environments/prod.env
#   newenv -T ~/.env.template       → ~/environments/<dirname>.env from template
#   newenv .env -T ~/.env.template  → template + custom project link

newenv () {
ENV_DIR=~/environments
TEMPLATE_DIR=~/newenv-templates
PROJECT_DIR="$(pwd)"
BASENAME="$(basename "$PROJECT_DIR")"


# Check if environment directory exists
if [[ ! -d $ENV_DIR ]]; then
  echo "Das Verzeichnis ~/environments existiert nicht. Bitte erstellen Sie es zuerst."
  mkdir -p $ENV_DIR
fi

# Defaults
LINK_NAME=".env.local"
ENV_NAME="$BASENAME.env"
TEMPLATE=""

# Optionen
while getopts ":T:" opt; do
  case "$opt" in
    T) TEMPLATE="$OPTARG" ;;
    \?) echo "Ungültige Option: -$OPTARG" >&2; exit 1 ;;
    :) echo "Option -$OPTARG benötigt ein Argument." >&2; exit 1 ;;
  esac
done
shift $((OPTIND - 1))

[[ -n "$1" ]] && LINK_NAME="$1"
[[ -n "$2" ]] && ENV_NAME="$2"

TARGET_FILE="$ENV_DIR/$ENV_NAME"
LINK_PATH="$PROJECT_DIR/$LINK_NAME"

# Template anwenden
if [[ -n "$TEMPLATE" ]]; then
  TEMPLATE_PATH="$TEMPLATE_DIR/$TEMPLATE.env"
  if [[ ! -f "$TEMPLATE_PATH" ]]; then
    echo "Template nicht gefunden: $TEMPLATE_PATH"
    echo "Verfügbare Templates:"
    ls "$TEMPLATE_DIR" | sed 's/\.env$//'
    exit 0
  fi
  cp "$TEMPLATE_PATH" "$TARGET_FILE"
  # Check if $TEMPLATE = Symfony and if so echo some things
  echo "Template: $TEMPLATE"
  if [[ "$TEMPLATE" == "symfony-mysql" ]]; then
    echo "symfony-mysql Template erkannt."
    herd link --secure
    echo "APP_URL=https://$(basename "$PROJECT_DIR" | tr '-' '_').test" >> "$TARGET_FILE"
    echo "DATABASE_URL=mysql://root:root@127.0.0.1:3306/$(basename "$PROJECT_DIR" | tr '-' '_')" >> "$TARGET_FILE"
    # Create new DATABASE if it does not exist
    mysql -h 127.0.0.1 -u root -proot -e "CREATE DATABASE IF NOT EXISTS $(basename "$PROJECT_DIR" | tr '-' '_');"
  fi
  echo "Template verwendet: $TEMPLATE_PATH → $TARGET_FILE"
fi

# .env.local verwenden falls nichts da
if [[ ! -f "$TARGET_FILE" && -f "$PROJECT_DIR/.env.local" ]]; then
  cp "$PROJECT_DIR/.env.local" "$TARGET_FILE"
  echo ".env.local kopiert → $TARGET_FILE"
fi

# Leere Datei, falls nötig
if [[ ! -f "$TARGET_FILE" ]]; then
  touch "$TARGET_FILE"
  echo "Leere Datei erstellt: $TARGET_FILE"
fi

# Bestehendes Ziel löschen
if [[ -L "$LINK_PATH" || -f "$LINK_PATH" ]]; then
  rm "$LINK_PATH"
fi

ln -s "$TARGET_FILE" "$LINK_PATH"
echo "Symlink erstellt: $LINK_PATH → $TARGET_FILE"
}