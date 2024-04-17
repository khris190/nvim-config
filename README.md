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
<!--   currently lazygit doesn't hide on edit so i added <CMD>q<CR> to the command, just remember that if its fixed it might need to be removed -->
- lazygit 
- ripgrep


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
 [text](www.google.com/test)
