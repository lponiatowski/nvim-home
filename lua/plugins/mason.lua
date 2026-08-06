-- mason.nvim configuration
return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  event = "VeryLazy",
  build = ":MasonUpdate",
  opts = {
    ui = {
      border = "rounded",
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
      },
    },
    max_concurrent_installers = 4,
    github = {
      download_url_template = "https://github.com/%s/releases/download/%s/%s",
    },
  },
  config = function(_, opts)
    require("mason").setup(opts)
    local mr = require("mason-registry")
    mr:on("package:install:success", function()
      vim.notify("Mason: package installed successfully")
    end)
    mr:on("package:install:failed", function(pkg)
      vim.notify("Mason: failed to install " .. pkg.name)
    end)
  end,
}
