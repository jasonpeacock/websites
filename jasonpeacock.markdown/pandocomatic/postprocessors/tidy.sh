#!/usr/bin/env bash
set -o errexit -o nounset -o pipefail

# Need to use latest version (5.6) of tidy.
tidy -quiet -indent -wrap 78 -utf8
