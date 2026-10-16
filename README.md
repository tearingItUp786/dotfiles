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

## Docker (Colima)

Docker Desktop isn't used. Colima + the Docker CLI are installed via the `Brewfile`.

1. Create `~/.docker/config.json` (intentionally untracked, since `docker login` writes to it):
   ```json
   { "cliPluginsExtraDirs": ["/opt/homebrew/lib/docker/cli-plugins"] }
   ```
2. `colima-up` starts the VM (defaults: 4 CPU / 8 GB RAM / 60 GB disk). Override with `COLIMA_CPU`, `COLIMA_MEMORY`, `COLIMA_DISK`, or pass flags, e.g. `colima-up --memory 12`.
3. `lzd` opens lazydocker.
4. `brew services start colima` to autostart at login.

## tmux

1. `brew install tmux`
2. Launch a tmux session - `tmux`
3. Run `C-A I` (C is Control) (the link)[https://github.com/tmux-plugins/tpm#key-bindings]

## Work / home split

`zshrc` is shared. It ends by sourcing `zshrc.work` when the hostname matches `CAMG*`, otherwise `zshrc.home`.
Work secrets live in untracked `~/.secrets.work` (exports for `ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, `GEMINI_API_KEY`, `TAVILY_API_KEY`, `JIRA_API_TOKEN`); home uses 1Password `op read`.
