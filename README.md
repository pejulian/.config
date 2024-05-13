# Julian's dotfiles

- [Pre-requisites](#pre-requisites)

I primarily use MacOS and WSL2 in Windows 10/11 for development.

These configuration files are catered to the above 2 environments.

> NOTE: `.zshrc` and other home folder configuration files are **NOT** included in this repo.

## Pre-requisites

1. A terminal that supports truecolor (I use iTerm2 in MacOS and Terminal for Windows 10/11)
2. Install [homebrew](https://brew.sh/) and ensure that it is on your path (e.g. `brew --version` outputs a valid homebrew version)
3. Install neovim via `brew install neovim`
4. Install proper fonts
   - In MacOS
     - `brew tap homebrew/cask-fonts`
     - `brew install font-meslo-lg-nerd-font`
     - Apply the font in your terminal profile
   - In WSL
     - Manually [download](https://www.nerdfonts.com/font-downloads) your preferred font from [nerdfonts](https://www.nerdfonts.com/)
     - Install the font **in Windows**
     - Apply the font in Terminal (or your equivalent truecolor terminal)
5. Install command line tools tools. I follow [this](https://www.youtube.com/watch?v=mmqDYw9C30I) or [this](https://bit.ly/49I5eqU&v=mmqDYw9C30I)
   - `brew install git`
   - `brew install ghq` (I use this for cloning repos into self, and well organized, folder structures)
   - `brew install ripgrep`
   - `brew install fzf`
   - `brew install bat` (I go one step further and alias `cat` to `bat`, but you don't have to if you don't want to)
   - `brew install git-delta`
   - `brew install eza`
   - `brew install tlrc`
6. Install `asdf` for easy management of runtimes (`node`, `python`, `go`, `java`)
7. If running in WSL2, it is also necessary to install Lazygit via `brew install lazygit`
