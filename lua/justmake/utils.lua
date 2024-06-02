local M = {}

local cache = {}

M.find_justmake_file = function(justmake_file_names)
	local path = vim.api.nvim_buf_get_name(0)

	if path == '' then
		path = vim.fn.getcwd()
	elseif (vim.loop.fs_stat(path).type == "file") then
		path = vim.fs.dirname(path)
	end

	local file = cache[path]

	if file == nil then
		-- find justmake file
		file = vim.fs.find(justmake_file_names, { path = path, upward = true })[1]
		cache[path] = file
	elseif (vim.fn.filereadable(file) ~= 1) then
		-- invalidate cache and search for file
		cache[path] = nil
		file = M.find_justmake_file(justmake_file_names)
	end

	return file
end

M.clear_cache = function()
	cache = {}
end


return M
