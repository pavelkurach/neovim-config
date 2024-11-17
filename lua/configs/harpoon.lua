M = {}

M.setup = function()
  local harpoon = require "harpoon"
  harpoon:setup {}

  -- basic telescope configuration
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers")
      .new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table {
          results = file_paths,
        },
        previewer = conf.file_previewer {},
        sorter = conf.generic_sorter {},
      })
      :find()
  end

  vim.keymap.set("n", "hm", function()
    toggle_telescope(harpoon:list())
  end, { desc = "Open harpoon window" })

  vim.keymap.set("n", "ha", function()
    harpoon:list():add()
  end)

  vim.keymap.set("n", "hx", function()
    harpoon:list():remove()
  end)

  vim.keymap.set("n", "h1", function()
    harpoon:list():select(1)
  end)
  vim.keymap.set("n", "h2", function()
    harpoon:list():select(2)
  end)
  vim.keymap.set("n", "h3", function()
    harpoon:list():select(3)
  end)
  vim.keymap.set("n", "h4", function()
    harpoon:list():select(4)
  end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "hp", function()
    harpoon:list():prev()
  end)
  vim.keymap.set("n", "hn", function()
    harpoon:list():next()
  end)

  vim.keymap.set("n", "hqm", function()
    harpoon.ui:toggle_quick_menu(harpoon:list())
  end)
end

return M