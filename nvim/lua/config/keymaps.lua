-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal<cr>", { desc = "Reveal current file in Neo-tree" })
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("v", "jk", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>to", function()
  require("cmp").setup.buffer({
    sources = {
      { name = "ollama" },
    },
  })
  print("💻 Switched to Ollama (DeepSeek)")
end, { desc = "Toggle Ollama Completions" })

vim.keymap.set("n", "<leader>tc", function()
  require("cmp").setup.buffer({
    sources = {
      { name = "copilot" },
    },
  })
  print("☁️ Switched to Copilot")
end, { desc = "Toggle Copilot Completions" })
