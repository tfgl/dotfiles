#!/bin/sh

if [[ ! -f ./localconfig/env ]]; then
    echo copying env.default to env

    # write the shebang and the DOTFILES variables first (needed for other var defined in env.default)
    printf "#!/bin/env sh\nDOTFILES=$(pwd)\n" > ./localconfig/env

    cat ./env.default >> ./localconfig/env
fi
source ./localconfig/env

if [[ ! -f "${FAVDIR}" ]]; then
    touch "${FAVDIR}"
    echo "touch ${FAVDIR}"
fi

dir=$(pwd)

cd ~/
ln -sf "$dir/bashrc" ./.bashrc
ln -sf "$dir/gitconfig" ./.gitconfig
ln -sf "$dir/xinitrc" ./.xinitrc
ln -sf "$dir/zshrc" ./.zshrc
ln -sf "$dir/zshprofile" ./.zshprofile

ln -nsf "$dir/doom.d" ./.doom.d

cd ~/.config
ln -nsf "$dir/alacritty" ./alacritty
ln -nsf "$dir/nvim" ./nvim
ln -nsf "$dir/sway" ./sway
ln -nsf "$dir/waybar" ./waybar
ln -nsf "$dir/tmux" ./tmux
ln -nsf "$dir/localconfig" ./localconfig

cd ~/Documents
ln -sf "$dir/bash_alias" ./bash_alias
