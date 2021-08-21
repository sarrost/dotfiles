-- Where to look for snippets.
vim.g.UltiSnipsSnippetDirectories = { vim.env.XDG_CONFIG_HOME .. '/nvim/snips' }

-- Insert mode mappings.
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<c-j>'
vim.g.UltiSnipsJumpBackwardTrigger = '<c-k>'
