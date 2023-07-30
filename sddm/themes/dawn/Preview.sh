#! /bin/bash

export QT_IM_MODULE="qtvirtualkeyboard"
here="$(realpath "$(dirname "${0}")")"

sddm-greeter --test-mode --theme "${here}" | grep "(WW)"

