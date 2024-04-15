# 💤 LazyVim



A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## for warp
use alt as modifier in warp
alias to rename tabs:
alias nvim='echo -ne "\033]0;" $(basename "$(pwd)")"\007"; nvim'

## requirements
- neovim-remote
- lldb
- lazygit
- ripgrep


## turn format off for ts for use with local config
local function autogroup(name)
	return vim.api.nvim_create_augroup("local_config_" .. name, { clear = true })
end
vim.api.nvim_create_autocmd("BufEnter", {
	group = autogroup("remove_ts_formatting"),
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
