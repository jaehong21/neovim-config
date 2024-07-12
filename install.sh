sudo xcodebuild -license accept

echo "Install Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install git wget gnupg
brew install tree fd sd ripgrep watch
brew install awscli kubectl helm pre-commit jq yq # circleci
brew install mas gh k9s dive gitui
brew install jesseduffield/lazygit/lazygit
brew install --cask hammerspoon
brew install --cask font-hack-nerd-font
helm plugin install https://github.com/databus23/helm-diff

# Docker (colima)
# https://aosolorzano.medium.com/installing-colima-as-a-docker-engine-provider-with-buildx-and-compose-plugins-installed-1ce8b3bae158
brew install docker colima
docker context use colima # should be colima for now

# set `network.address` to `true`
vim $HOME/.colima/default/colima.yaml

# docker-compose (colima)
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
DOCKER_COMPOSE_VERSION=v2.28.1
DOCKER_COMPOSE_ARCH=darwin-aarch64
curl -SL https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$DOCKER_COMPOSE_ARCH -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
# docker compose version

# buildx (colima)
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
BUILDX_VERSION=v0.15.1
BUILDX_ARCH=darwin-arm64
curl -SL https://github.com/docker/buildx/releases/download/$BUILDX_VERSION/buildx-$BUILDX_VERSION.$BUILDX_ARCH -o $DOCKER_CONFIG/cli-plugins/docker-buildx
chmod +x $DOCKER_CONFIG/cli-plugins/docker-buildx
docker buildx install
# docker buildx version

# Terraform 1.7.4
brew install tfenv
tfenv install 1.7.4
tfenv use 1.7.4

echo "Install kitty..."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo "include $HOME/.config/nvim/kitty.conf" > $HOME/.config/kitty/kitty.conf

echo "Install oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# oh-my-zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
brew install autojump

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
nvm install 18.17.1
nvm alias default 18.17.1
npm i -g pnpm@8.7.0

# Golang
# export PATH=$PATH:~/go/bin
brew install go
go install github.com/air-verse/air@latest
go install github.com/volatiletech/sqlboiler/v4@v4.14.2
go install github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-psql@v4.14.2

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Java (sdkman)
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 17.0.2.8.1-amzn
sdk install gradle 8.0.2
# sdk use java 17.0.2.8.1-amzn
# sdk use gradle 8.0.2
# sdk default java 17.0.2.8.1-amzn
# sdk default gradle 8.0.2

# pyenv
brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

pyenv install 3.12 # after source ~/.zshrc
pyenv global 3.12

# Poetry
curl -sSL https://install.python-poetry.org | python3 -
# https://python-poetry.org/docs/configuration/#virtualenvsin-project
# poetry config virtualenvs.in-project true 

echo "Install Neovim"
# export PATH=$PATH:~/.local/share/bob/nvim-bin
cargo install bob-nvim
bob install 0.10.0
bob use 0.10.0

echo "Install apps via brew..."
brew install --cask arc
brew install --cask obsidian
brew install --cask postman
brew install --cask raycast
brew install --cask notion
brew install --cask setapp
brew install --cask 1password
brew install --cask jetbrains-toolbox
brew install --cask jordanbaird-ice
brew install --cask scroll-reverser
# brew install --cask pritunl
# brew install --cask linear-linear

echo "Install apps via mas..."
mas install 497799835 # Xcode
mas install 985367838 # Outlook
mas install 462062816 # Powerpoint
mas install 462054704 # Word
mas install 462058435 # Excel
mas install 869223134 # KakaoTalk
mas install 803453959 # Slack
mas install 1429033973 # RunCat
mas install 1451177988 # Petrify
mas install 1475387142 # Tailscale
# mas install 1102655071 # Channel Talk

