# dotfiles

## Editor

### [Vim](https://www.vim.org/)

```shell
# 0. directories
# shell
mkdir -p ${XDG_STATE_HOME:-~/.local/state}/vim/{undo,swap}
# powershell ~\AppData\Local
mkdir $env:LOCALAPPDATA\vim\undo
mkdir $env:LOCALAPPDATA\vim\swap

1. using `.vim`
ln -s /[path]/dotfiles/vim/vimrc ~/.vim/vimrc

2. using XDG Base Directory
ln -s /[path]/dotfiles/vim $XDG_CONFIG_HOME/vim
```

### [Neovim](https://github.com/neovim/neovim)

```shell
# 0. directories
# shell
mkdir -p ${XDG_STATE_HOME:-~/.local/state}/nvim/{undo,swap}
# powershell ~\AppData\Local
mkdir $env:LOCALAPPDATA\nvim-data\undo
mkdir $env:LOCALAPPDATA\nvim-data\swap

# 1. using `.config`
ln -s /[path]/dotfiles/nvim ~/.config/nvim

# 2. using XDG Base Directory
ln -s /[path]/dotfiles/nvim $XDG_CONFIG_HOME/nvim
```

## Shell

### [Startship](https://github.com/starship/starship)

- `starship.toml`

  ```shell
  ln -s /[path]/dotfiles/starship.toml ~/.config/starship.toml
  ```

### [Fish](https://fishshell.com/)

- `config.fish`

  ```shell
  # 1. using `.config`
  rm ~/.config/fish/config.fish
  ln -s /[path]/dotfiles/fish/config.fish ~/.config/fish/config.fish

  # 2. using XDG Base Directory
  rm $XDG_CONFIG_HOME/fish/config.fish
  ln -s /[path]/dotfiles/fish/config.fish $XDG_CONFIG_HOME/fish/config.fish
  ```

### Zsh

- Switch to Zsh

  ```shell
  cat /etc/shells
  chsh -s $(which zsh)
  reboot
  ```

- `.zshrc`

  ```shell
  cp /[path]/dotfiles/zsh/.zshrc ~
  ```

- Plugins

  - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

    ```shell
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${XDG_DATA_HOME:-~/.local/share}/zsh/plugins/zsh-autosuggestions
    ```

  - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

    ```shell
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${XDG_DATA_HOME:-~/.local/share}/zsh/plugins/zsh-syntax-highlighting
    ```

## Terminal Emulator

### [Ghostty](https://ghostty.org/)

```shell
rm -r ~/.config/ghostty
# 1. using `.config`
ln -s /[path]/dotfiles/ghostty ~/.config/ghostty
# or
cp -r /[path]/dotfiles/ghostty ~/.config/ghostty

# 2. using XDG Base Directory
rm -r $XDG_CONFIG_HOME/ghostty
ln -s /[path]/dotfiles/ghostty $XDG_CONFIG_HOME/ghostty
# or
cp -r /[path]/dotfiles/ghostty $XDG_CONFIG_HOME/ghostty
```

### ~~[Alacritty](https://github.com/alacritty/alacritty)~~

```shell
# 1. using `.config`
ln -s /[path]/dotfiles/alacritty ~/.config/alacritty
# or
cp -r /[path]/dotfiles/alacritty ~/.config/alacritty

# 2. using XDG Base Directory
ln -s /[path]/dotfiles/alacritty $XDG_CONFIG_HOME/alacritty
# or
cp -r /[path]/dotfiles/alacritty $XDG_CONFIG_HOME/alacritty
```

### ~~[WezTerm](https://github.com/wezterm/wezterm)~~

```shell
# 1. using `.config`
ln -s /[path]/dotfiles/wezterm ~/.config/wezterm
# or
cp -r /[path]/dotfiles/wezterm ~/.config/wezterm

# 2. using XDG Base Directory
ln -s /[path]/dotfiles/wezterm $XDG_CONFIG_HOME/wezterm
# or
cp -r /[path]/dotfiles/wezterm $XDG_CONFIG_HOME/wezterm
```

## Multiplexer

### tmux + [Oh my tmux!](https://github.com/gpakosz/.tmux)

```shell
# 1. using `.confg`
git clone https://github.com/gpakosz/.tmux.git ~/.config/oh-my-tmux
mkdir -p ~/.config/tmux
ln -s ~/.config/oh-my-tmux/.tmux.conf ~/.config/tmux/tmux.conf
ln -s /[path]/dotfiles/tmux/.tmux.conf.local ~/.config/tmux/tmux.conf.local

# 2. using XDG Base Directory
git clone https://github.com/gpakosz/.tmux.git $XDG_CONFIG_HOME/oh-my-tmux
mkdir -p $XDG_CONFIG_HOME/tmux
ln -s $XDG_CONFIG_HOME/oh-my-tmux/.tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
ln -s /[path]/dotfiles/tmux/.tmux.conf.local $XDG_CONFIG_HOME/tmux/tmux.conf.local
```

## Tool

### [Yazi](https://github.com/sxyazi/yazi)

- [Default config](https://github.com/sxyazi/yazi/tree/shipped/yazi-config/preset)

- Packages

  ```shell
  ya pkg install
  ya pkg upgrade
  ```

```shell
# 1. using `.config`
ln -s /[path]/dotfiles/yazi ~/.config/yazi
# or
cp -r /[path]/dotfiles/yazi ~/.config/yazi

# 2. using XDG Base Directory
ln -s /[path]/dotfiles/yazi $XDG_CONFIG_HOME/yazi
# or
cp -r /[path]/dotfiles/yazi $XDG_CONFIG_HOME/yazi
```
