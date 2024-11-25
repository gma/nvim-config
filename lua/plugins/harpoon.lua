return {
  {
    "theprimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<C-A-p>", mark.add_file, { desc = "Add file to Harpoon" })
      vim.keymap.set("n", "<A-p>", ui.toggle_quick_menu, { desc = "Toggle Harpoon quick menu" })
      vim.keymap.set("n", "<A-[>", function() ui.nav_prev() end, { desc = "Previous Harpoon file" })
      vim.keymap.set("n", "<A-]>", function() ui.nav_next() end, { desc = "Next Harpoon file" })
      vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end, { desc = "Harpoon file 1" })
      vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end, { desc = "Harpoon file 2" })
      vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end, { desc = "Harpoon file 3" })
      vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end, { desc = "Harpoon file 4" })
      vim.keymap.set("n", "<A-5>", function() ui.nav_file(5) end, { desc = "Harpoon file 5" })
      vim.keymap.set("n", "<A-6>", function() ui.nav_file(6) end, { desc = "Harpoon file 6" })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}
