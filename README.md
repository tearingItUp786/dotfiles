# Taran's Dotfiles

My collection of dotfiles that I've started collecting through the years.

## Prerequisites

Have these installed on your machine

- homebrew
- golang
- volta
- neovim
- tmux
- prettier (global)
- 1password (used for secret management)

## Getting started

Clone this repo and after `cding` into it, run `./install`.

## neovim

1. `brew install neovim`

### Managing configs

The way in which I manage my neovim configs is by using a function inside of my `zshrc` file.

```zsh
function nvims() {
  items=("default" "home")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}
```

This function will show a list of configs that I have in my `~/.config` folder and only those that are in the items array will be shown.

I did this so that I can have a WIP config that I can quickly switch to when I'm working on something and a "get shit done" mode that I can switch to when I don't have time to play around.

https://www.youtube.com/watch?v=LkHjJlSgKZY

### Work profile

Work forces use to use copilot and not supermaven. I'll need to follow [this repo](https://github.com/github/copilot.vim)

## tmux

1. `brew install tmux`
2. Launch a tmux session - `tmux`
3. Run `C-A I` (C is Control) (the link)[https://github.com/tmux-plugins/tpm#key-bindings]
