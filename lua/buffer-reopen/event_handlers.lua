-- Auto cmd event handlers
local M = {}

-- On buffer delete event
function M.on_buf_delete(ev)
	local store = require("buffer-reopen.store")
	local bufname = vim.api.nvim_buf_get_name(ev.buf)
	if bufname ~= "" then
		table.insert(store.closed_buffers, 1, bufname)
	end
end

return M
