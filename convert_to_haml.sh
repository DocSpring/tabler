#!/bin/bash
set -e -o pipefail
for HTML_FILE in $(find demo -name \*.html -print); do
  HAML_FILE="$(echo $HTML_FILE | sed -e 's/.html$/.haml/' -e 's%demo\/%demo-haml/%')"

  if [ -f "$HAML_FILE" ]; then
    echo "$HAML_FILE already exists!"
    continue
  fi
  HAML_DIR=$(dirname $HAML_FILE)
  mkdir -p "$HAML_DIR"
  echo "html2haml $HTML_FILE => $HAML_FILE"
  html2haml "$HTML_FILE" "$HAML_FILE"
done
