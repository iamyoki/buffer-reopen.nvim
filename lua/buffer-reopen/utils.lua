local M = {}

-- Reopen last closed buffer
function M.reopen_last_closed_buffer()
	local store = require("buffer-reopen.store")
	if #store.closed_buffers > 0 then
		local last_buffer = table.remove(store.closed_buffers, 1)
		vim.cmd("edit " .. vim.fn.fnameescape(last_buffer))
		print("Reopened buffer: " .. last_buffer)
	else
		print("No closed buffers to reopen")
	end
end

-- Show closed buffers
function M.show_closed()
	local store = require("buffer-reopen.store")
	print("Closed buffers:")
	for i, name in ipairs(store.closed_buffers) do
		print(i .. ": " .. name)
	end
end

return M
