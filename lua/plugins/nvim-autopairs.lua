return {
  "windwp/nvim-autopairs",
	enabled = true,
	event = "InsertEnter",
  opts = {
    check_ts = true,
		enable_check_bracket_line = true,
		iignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
		disable_filetype = { "TelescopePrompt" },
  }
}
