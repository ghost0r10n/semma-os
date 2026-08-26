-- Nova language support.
--
-- The syntax file lives in the Nova repo rather than here, because that is
-- where the keyword list comes from: `nova editor --check` compares the
-- syntax file against compiler/src/token.c and fails if they have drifted.
-- Vendoring a copy into this flake would put the file somewhere that check
-- cannot see, and it would go stale the first time a keyword changes.
--
-- Pointing at the working tree also means edits take effect on the next
-- buffer, with no nixos-rebuild.
return {
  {
    dir = vim.fn.expand('~/dev/sbr/editors/nvim'),
    name = 'nova',
    -- Only load when a Nova file is opened.
    ft = 'nova',
    -- Nothing to configure: the plugin is three vim files.
    config = false,
  },
}
