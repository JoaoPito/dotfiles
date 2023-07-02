
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

# This makes spotify cooperate with window managers:
LD_PRELOAD=/home/joaopito/Programas/spotifywm spotify
