#!/bin/sh

if [[ ! -f ./config/localconfig/env ]]; then
  DOTFILES=$(pwd)
  echo appending env.default to env

  cat ./env.default > ./config/localconfig/env

  # append the DOTFILES variables
  echo "export DOTFILES=\"$DOTFILES\"" >> ./config/localconfig/env

  echo "Add 'source $DOTFILES/config/localconfig/env' at the end of /etc/profile"
fi
source ./config/localconfig/env

if [[ ! -f "${FAVDIR}" ]]; then
    touch "${FAVDIR}"
    echo "touch ${FAVDIR}"
fi

for f in config/*; do
  echo "linking $f to $XDG_CONFIG_HOME/"
  ln -nsfr "$f" "$XDG_CONFIG_HOME/"
done
