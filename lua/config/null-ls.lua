local null_ls_ok, null_ls = pcall(require, "null-ls")
if not null_ls_ok then
  return
end

local sources = {
  -- python
 -- null_ls.builtins.formatting.black.with({
   -- extra_args = { "--line-length=120" }
 -- }),
	--
	null_ls.builtins.formatting.autopep8,
	-- c
	null_ls.builtins.formatting.clang_format,
}

null_ls.setup({
	 on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                  vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
	sources = sources })
