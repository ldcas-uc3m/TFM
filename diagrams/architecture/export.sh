#!/bin/bash

set -euo pipefail


# ----------
# convert drawio
# ----------

# check if docker
if ! command -v docker >/dev/null 2>&1; then
    echo "Docker is not installed. Please install from https://docs.docker.com/get-docker/"
    exit 1
fi

# convert
echo "Converting draw.io files..."
docker run -it -v $(pwd):/data rlespinasse/drawio-export --format=svg --remove-page-suffix --output=.


# ----------
# convert mermaid
# ----------

# check if bunx/npx
if command -v bun >/dev/null 2>&1; then
    RUNNER="bunx"
elif command -v npx >/dev/null 2>&1; then
    RUNNER="npx"
else
    echo "Error: Neither 'bun' nor 'npm/npx' was found."
    echo "Please install Bun (https://bun.sh) or Node.js (https://nodejs.org) to continue."
    exit 1
fi

# check inkscape installed
if ! command -v inkscape &> /dev/null; then
    echo "Inkscape is not installed. Please install it first (blame foreignObjects.)."
    exit 1
fi

# convert
for file in *.mmd; do
    output_pdf="${file%.mmd}.pdf"
    output_svg="${file%.mmd}.svg"
    echo "Converting $file -> $output_svg"

    # we generate in PDF and re-encode to SVG w/ inkscape bc foreignObjects
    # https://github.com/typst/typst/discussions/3090#discussioncomment-7960440
    $RUNNER @mermaid-js/mermaid-cli -i "$file" -o "$output_pdf" -c true-neutral-style.json --pdfFit

    inkscape "$output_pdf" --export-type=svg --export-plain-svg --export-filename="$output_svg" > /dev/null

    rm "$output_pdf"
done

echo "Done!"