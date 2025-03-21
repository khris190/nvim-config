# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## for warp

use alt as modifier in warp
alias to rename tabs:

```bash
  alias nvim='
  if [ -n "$(git config --get remote.origin.url)" ]; then
    repo_name=$(basename -s .git $(git config --get remote.origin.url))
  else
    repo_name=$(basename "$(pwd)")
  fi
  echo -ne "\033]0;"$repo_name"\007"; nvim'
```

## requirements

- neovim-remote
- lldb
- lazygit
- ripgrep
- fzf
- fd
- golang
- rustup
- rust
- cargo
- python
- pip
- npm
- java17 (for sonarlint)

move lazygit.yml to proper dir explained inside


## turn format off for ts for use with local config

```lua
local function autogroup(name)
 return vim.api.nvim_create_augroup("local_config_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd("BufEnter", {
 group = autogroup("remove_ts_formatting"),
  desc = "Turns off tsserver Formatting for .ts files",
 pattern = { "*.ts" },
 callback = function(ev)
  print("callback")
  local clients = vim.lsp.buf_get_clients(0)
  for _, client in pairs(clients) do
   if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
    print("off")
   end
  end
 end,
})
```

callback
 [text link](www.google.com/test)

## windows

install in ~/AppData/Local/nvim

``` bash
choco install go rust ripgrep lazygit git nvm nerd-fonts-jetbrainsmono mingw cmake
nvm install latest
nvm use latest
```

add cmake to path?
move lazygit.yml to proper dir explained inside
