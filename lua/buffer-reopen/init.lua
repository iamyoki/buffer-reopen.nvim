local M = {}

M.setup = function(opts)
	-- Auto cmd
	vim.api.nvim_create_autocmd("BufDelete", {
		callback = require("buffer-reopen.event_handlers").on_buf_delete,
	})

	-- Keymap
	vim.keymap.set(
		"n",
		"<leader>bt",
		require("buffer-reopen.utils").reopen_last_closed_buffer,
		{ noremap = true, silent = true, desc = "Reopen Last Closed Buffer" }
	)

	vim.keymap.set(
		"n",
		"<C-S-t>",
		require("buffer-reopen.utils").reopen_last_closed_buffer,
		{ noremap = true, silent = true, desc = "Reopen Last Closed Buffer" }
	)

	-- User command
	vim.api.nvim_create_user_command("BufferHistory", function(inputOps)
		local arg = inputOps.fargs[1] or ""

		if arg == "reopen" then
			require("buffer-reopen.utils").reopen_last_closed_buffer()
		end

		if arg == "show_closed" then
			require("buffer-reopen.utils").show_closed()
		end
	end, {
		nargs = 1,
		complete = function()
			return { "reopen", "show_closed" }
		end,
	})
end

return M
