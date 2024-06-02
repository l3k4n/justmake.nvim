local M = {}

local utils = require("justmake.utils")

local run_target = function(target)
	local justmake_file = utils.find_justmake_file(M.justmake_file_names)
	if (justmake_file == nil) then
		vim.notify("Justmake: justmake file not found", vim.log.levels.ERROR)
		return
	end

	if (M.make_executable == nil) then
		vim.notify("Justmake: make executable not found", vim.log.levels.ERROR)
		return
	end

	local cmd = string.format("%s -s -f %s %s", M.make_executable, justmake_file, target)
	local cmd_output = vim.fn.system(cmd)
	local log_level = vim.log.levels.OFF

	if (vim.v.shell_error ~= 0) then
		log_level = vim.log.levels.ERROR
	end

	vim.notify(cmd_output, log_level)
end

M.justmake_file_names = { 'just.make', 'just.makefile' }

M.make_executable = nil

M.setup = function()
	M.make_executable = vim.fn.exepath("make")
end

M.run = function() run_target("run") end

M.build = function() run_target("build") end

M.test = function() run_target("test") end

M.clean = function() run_target("clean") end

return M
