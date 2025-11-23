---@type vim.lsp.Config
return {
  init_options = {
    format = {
      enable = true,
    },
    lint = {
      enable = true,
    },
    scan_cmake_in_package = true,
    semantic_token = false,
  },
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
        },
      },
    },
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
        relativePatternSupport = true,
      },
    },
  },
  single_file_support = true,
}
