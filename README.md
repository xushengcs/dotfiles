# dotfiles

## Editor

### [Vim](https://www.vim.org/)

```shell
# shell
mkdir -p ${XDG_STATE_HOME:-~/.local/state}/vim/{undo,swap}
# powershell ~\AppData\Local
mkdir $env:LOCALAPPDATA\vim\undo
mkdir $env:LOCALAPPDATA\vim\swap

1. using `.vim`
ln -s [path]/dotfiles/vim/vimrc ~/.vim/vimrc

2. using XDG Base Directory
ln -s [path]/dotfiles/vim $XDG_CONFIG_HOME/vim
```

### [Neovim](https://github.com/neovim/neovim)

```shell
# shell
mkdir -p ${XDG_STATE_HOME:-~/.local/state}/nvim/{undo,swap}
# powershell ~\AppData\Local
mkdir $env:LOCALAPPDATA\nvim-data\undo
mkdir $env:LOCALAPPDATA\nvim-data\swap

ln -s [path]/dotfiles/nvim ${XDG_CONFIG_HOME:-~/.config}/nvim
```

## Shell

### [Startship](https://github.com/starship/starship)

- `starship.toml`

  ```shell
  ln -s [path]/dotfiles/starship.toml ~/.config/starship.toml
  ```

### [Fish](https://fishshell.com/)

- `config.fish`

  ```shell
  rm ${XDG_CONFIG_HOME:-~/.config}/fish/config.fish
  ln -s [path]/dotfiles/fish/config.fish ${XDG_CONFIG_HOME:-~/.config}/fish/config.fish
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
  cp [path]/dotfiles/zsh/.zshrc ~
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
rm -r ${XDG_CONFIG_HOME:-~/.config}/ghostty
ln -s [path]/dotfiles/ghostty ${XDG_CONFIG_HOME:-~/.config}/ghostty
```

### ~~[Alacritty](https://github.com/alacritty/alacritty)~~

```shell
ln -s [path]/dotfiles/alacritty ${XDG_CONFIG_HOME:-~/.config}/alacritty
```

### ~~[WezTerm](https://github.com/wezterm/wezterm)~~

```shell
ln -s [path]/dotfiles/wezterm ${XDG_CONFIG_HOME:-~/.config}/wezterm
```

## Multiplexer

### tmux + [Oh my tmux!](https://github.com/gpakosz/.tmux)

```shell
git clone https://github.com/gpakosz/.tmux.git ${XDG_CONFIG_HOME:-~/.config}/oh-my-tmux
mkdir -p ${XDG_CONFIG_HOME:-~/.config}/tmux
ln -s ${XDG_CONFIG_HOME:-~/.config}/oh-my-tmux/.tmux.conf ${XDG_CONFIG_HOME:-~/.config}/tmux/tmux.conf
ln -s [path]/dotfiles/tmux/.tmux.conf.local ${XDG_CONFIG_HOME:-~/.config}/tmux/tmux.conf.local
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
ln -s [path]/dotfiles/yazi ${XDG_CONFIG_HOME:-~/.config}/yazi
```
