#!/bin/sh

if [[ ! -f ./localconfig/env ]]; then
    echo appending env.default to env

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

cd "$XDG_CONFIG_HOME"
ln -nsf "$dir/doom.d" ./.doom.d
ln -nsf "$dir/git" ./git
ln -nsf "$dir/hypr" ./hypr
ln -nsf "$dir/foot" ./foot
ln -nsf "$dir/nvim" ./nvim
ln -nsf "$dir/zsh" ./zsh
ln -nsf "$dir/sway" ./sway
ln -nsf "$dir/waybar" ./waybar
ln -nsf "$dir/tmux" ./tmux
ln -nsf "$dir/mpd" ./mpd
ln -nsf "$dir/localconfig" ./localconfig

echo "Add 'source path/to/dotfiles/localconfig/env at the end of /etc/profile"
