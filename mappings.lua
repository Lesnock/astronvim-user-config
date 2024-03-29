-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<leader>s"] = { ":tabe ~/.config/nvim/lua/user<cr>", desc = "Open Astronvim Config Folder" },

    ["<C-p>"] = {
      function() require("telescope.builtin").find_files { 
        hidden = true, 
        no_ignore = true,
        ignore_file_patterns = { "node%_modules/*" }
      } end,
      desc = "Find all files",
    },    
    -- second key is the lefthand side of the map
    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },

    ["<cr>"] = { "zz", desc = "Centralize screen" },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Move line
    ["<A-j>"] = { ":m .+1<cr>==", desc = "Move line down" },
    ["<A-k>"] = { ":m .-2<cr>==", desc = "Move line up" },
    ["<A-F>"] = {
      function()
         vim.lsp.buf.format()
      end,
      desc = "Format buffer"
    },
    ["<leader>P"] = { ":syntax sync fromstart<cr>", desc = "Sync syntax from start" },

    -- Rest Client
    ["<leader>R"] = {
      function()
        require('rest-nvim').run()
      end,
    },

    ["<leader>a"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Run LSP code actions"
    }

  },
  t = {
    ["<esc>"] = { "<C-\\><C-n>", desc = "Exit from terminal mode" },
  },
  i = {
    ["<C-s>"] = { "<esc>:w!<cr>", desc = "Save File" },

    -- move line
    ["<A-j>"] = { "<esc>:m .+1<cr>==gi", desc = "Move line down" },
    ["<A-k>"] = { "<esc>:m .-2<cr>==gi", desc = "Move line up" },

    ["<C-Space>"] = {
      function()
        vim.lsp.buf.hover()
      end,
      desc = "Show lsp options"
    }
  },
  v = {
    -- move line
    ["<A-j>"] = { ":m .+1<cr>==gi", desc = "Move line down" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move line up" },

    -- Surrounding
    ["("] = { "Sb", desc = "Surround selected with parentheses" }
  }
}
