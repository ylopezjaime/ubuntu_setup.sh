# bash script for my Ubuntu or ubuntu based linux Machine

# Set time for the dual boot to be the same in both case

timedatectl set-local-rtc 1

# add multiverse and universe repository and restricted
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted
# Update and Upgrade
sudo apt update
sudo apt upgrade
sudo apt install libfuse2t64 # appimage support
sudo apt install ubuntu-restricted-extras

# Install all the software
sudo apt update
sudo apt install nala
sudo nala install pip
sudo nala install nvidia-driver-555 # changing depending of the latest driver out
sudo nala install nvidia-cuda-toolkit
sudo nala install git
sudo nala install curl
sudo nala install build-essential
sudo nala install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo # Adding the access
sudo apt install gnome-tweaks
flatpak install flathub com.discordapp.Discord
flatpak install flathub com.mattjakeman.ExtensionManager
# Installing Microsoft Edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg

sudo nala update && sudo nala install microsoft-edge-stable
# Zsh
sudo nala install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p ~/.zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/powerlevel10k
echo 'source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme'>>~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh'>>~/.zshrc
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
echo 'source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'>>~/.zshrc

mkdir -p ~/.zsh && cd ~/.zsh && {
    curl -O 'https://raw.githubusercontent.com/minhanhhere/developer-tools/main/powerlevel10k/git-completion.bash'
    cd -; }

echo "

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh \$fpath)
autoload -Uz compinit && compinit
">>~/.zshrc

# Pywal for my colors
sudo pip3 install pywal --break-system-packages
# Torch, and matplotlib and dependencies
pip3 install torch torchvision torchaudio matplotlib numbpy panda scipy PyQt6 --break-system-packages

pip install PyQt6 --break-system-packages

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Python virtual environment
sudo nala install python3.12-venv
#For Neovim
sudo nala install ripgrep

# TODO : Add brew and neovim from Brew
#
