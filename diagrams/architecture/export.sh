#!/bin/bash

# convert
docker run -it -v $(pwd):/data rlespinasse/drawio-export --format=svg --remove-page-suffix --output=.
