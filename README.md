# Julian's dotfiles

- [Pre-requisites](#pre-requisites)
- [Recommendations](#recommendations)
- [FAQ](#faq)

I use MacOS and WSL2 in Windows 10/11 for development.

These configuration files cater for the above OS/environments.

> NOTE: `.zshrc` and other home folder configuration files are **NOT** included in this repo.

## Pre-requisites

> It is a good idea to get all pre-requisites below installed _before_ opening `neovim` for the first time.

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
   - `brew install wget`
   - `brew install git`
   - `brew install ghq` [Repository management](https://github.com/x-motemen/ghq)
   - `brew install ripgrep` [Better grep](https://github.com/BurntSushi/ripgrep/tree/master)
   - `brew install fzf` [Command line fuzzy finder](https://github.com/junegunn/fzf)
   - `brew install bat` [Better `cat`](https://github.com/sharkdp/bat)
   - `brew install git-delta` [Better `git diff`](https://github.com/dandavison/delta)
     You will need to set up `delta` in `~/.gitconfig`. Follow the instruction in the official repo linked above.
   - `brew install eza` [Replacement for `ls`](https://github.com/eza-community/eza)
   - `brew install exa` [Modern replacement for `ls`](https://github.com/ogham/exa)
   - `brew install tlrc`
   - `brew install lazygit` [Terminal UI for git](https://github.com/jesseduffield/lazygit)
   - `brew install jq` (For manipulation of JSON strutures via CLI)
   - `brew install peco` [Filtering tool](https://peco.github.io/)
   - `brew install gcc@13` (In WSL2, I had to install this before `telescope-fzf-native.nvim` could build)

## Recommendations

1. On Windows (WS2), it is necessary to install Visual Studio Build Tools
   - I use `chocolatey` on Windows, so I used [this](https://community.chocolatey.org/packages/visualstudio2022buildtools)
   - I used the "Full installation" command just to ensure there are no problems with missing functionality
2. Install [asdf](https://asdf-vm.com/) for easy management of multiple runtimes (`node`, `python`, `go`, `java`)
3. In WSL2, there might be an issue running certain plugins (such as the `prettierd` formatter in Mason) because the `$XDG_HOME_DIR` path is owned by the `root` user. To fix, follow [this](https://github.com/microsoft/WSL/issues/10846#issuecomment-1840548054) guide.

## FAQ

1. On WSL2, it was necessary to do some manual setup before `markdown-preview` could work.
   - Open up `.zshrc` and link Chrome browser to WSL:
     ```bash
     ln -sf "/mnt/c/Program Files/Google/Chrome/Application/chrome.exe" ~/.local/bin/chrome
     export CHROME_BROWSER=~/.local/bin/chrome
     ```
     > Take note of the path to the Chrome browser. It might be different on your machine.
   - `asdf plugin-add yarn`
   - `asdf install yarn latest`
   - `asdf global yarn <LASTEST_VERSION>` (at the time of writing, it was 1.22.22)
   - Open `neovim` and launch Lazy via `:Lazy`. Navigate to `markdown-preview`plugin and hit enter to view the installation path (`dir` properrty)
   - `cd` into the installation path, `cd` to `app` and run `yarn install`
   - Close and reopen `neovim` and try opening a markdown file. Now, the default browser should show up
