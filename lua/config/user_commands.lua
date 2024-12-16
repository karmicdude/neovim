local utils = require("core.utils")

-- View Ansible Vault encrypted buffer
vim.api.nvim_create_user_command("AnsibleVaultView", function()
	local cmd = "ansible-vault decrypt --output - " .. vim.fn.expand("%")
	local content = vim.fn.systemlist(cmd)
	if vim.v.shell_error ~= 0 then
		print("Command failed: " .. cmd)
	end
	local lines = vim.split(table.concat(content, "\n"), "\n", { true })
	-- take only last path + filename
	local shortened_path_to_file = string.match(vim.fn.expand("%:p"), ".+/([^/]+/.+)$")
	utils.create_buffer_in_new_tab("Preview: " .. shortened_path_to_file, "nofile", lines, "yaml")
end, {})
