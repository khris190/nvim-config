return {
  "ta-tikoma/php.easy.nvim",
  config = function()
    -- easy php
    vim.keymap.set("n", "-b", "<CMD>PHPEasyDocBlock<CR>")
    vim.keymap.set("n", "-r", "<CMD>PHPEasyReplica<CR>")
    vim.keymap.set("n", "-c", "<CMD>PHPEasyCopy<CR>")
    vim.keymap.set("n", "-d", "<CMD>PHPEasyDelete<CR>")
    vim.keymap.set("n", "-uu", "<CMD>PHPEasyRemoveUnusedUses<CR>")
    vim.keymap.set("n", "-e", "<CMD>PHPEasyExtends<CR>")
    vim.keymap.set("n", "-i", "<CMD>PHPEasyImplements<CR>")
    vim.keymap.set("n", "-ii", "<CMD>PHPEasyInitInterface<CR>")
    vim.keymap.set("n", "-ic", "<CMD>PHPEasyInitClass<CR>")
    vim.keymap.set("n", "-iac", "<CMD>PHPEasyInitAbstractClass<CR>")
    vim.keymap.set("n", "-it", "<CMD>PHPEasyInitTrait<CR>")
    vim.keymap.set("n", "-ie", "<CMD>PHPEasyInitEnum<CR>")
    vim.keymap.set({ "n", "v" }, "-c", "<CMD>PHPEasyAppendConstant<CR>")
    vim.keymap.set({ "n", "v" }, "-p", "<CMD>PHPEasyAppendProperty<CR>")
    vim.keymap.set({ "n", "v" }, "-m", "<CMD>PHPEasyAppendMethod<CR>")
    vim.keymap.set("n", "-_", "<CMD>PHPEasyAppendConstruct<CR>")
    vim.keymap.set("n", "-a", "<CMD>PHPEasyAppendArgument<CR>")
    require("php-easy-nvim").setup({})
  end,
  ft = { "php" },
}
