return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
	init = function()
 actions = require("diffview.actions")
		require("diffview").setup({
			enhanced_diff_hl = true,
			view = {
				default = {
					winbar_info = true,
				},
			},
			keymaps = {
				disable_defaults = true,
				view = {
					{ "n", "<tab>", actions.select_next_entry, { desc = "󰕚 Diff for the next file" } },
					{ "n", "<s-tab>", actions.select_prev_entry, { desc = "󰕚 Diff for the previous file" } },
					{ "n", "<cr>", actions.select_entry, { desc = "󰅴 Open the diff for the selected entry." } },
					{ "n", "gf", actions.goto_file_tab, { desc = "󰅴 Open the file in a new tab" } },
					{ "n", "gp", actions.goto_file_edit, { desc = "󰅴 Open the file in the previous tab" } },
					{ "n", ",e", actions.focus_files, { desc = "󰅴 Bring focus to the file panel" } },
					{ "n", ",b", actions.toggle_files, { desc = "󰅴 Toggle the file panel." } },
					{ "n", ",l", actions.cycle_layout, { desc = "󰅴 Cycle through available layouts." } },
					{ "n", ",cp", actions.prev_conflict, { desc = " Jump to the previous conflict" } },
					{ "n", ",cn", actions.next_conflict, { desc = " Jump to the next conflict" } },
					{ "n", ",co", actions.conflict_choose("ours"), { desc = " Apply `OURS` version" } },
					{ "n", ",cO", actions.conflict_choose_all("ours"), { desc = " Apply `OURS` version for all" } },
					{ "n", ",ct", actions.conflict_choose("theirs"), { desc = " Apply `THEIRS` version" } },
					{ "n", ",cT", actions.conflict_choose_all("theirs"), { desc = " Apply `THEIRS` for all" } },
					{ "n", ",cb", actions.conflict_choose("base"), { desc = " Apply `BASE` version" } },
					{ "n", ",cB", actions.conflict_choose_all("base"), { desc = " Apply `BASE` version for all" } },
					{ "n", ",ca", actions.conflict_choose("all"), { desc = " Apply ALL versions" } },
					{ "n", ",cA", actions.conflict_choose_all("all"), { desc = " Apply ALL versions for all" } },
					{ "n", "dx", actions.conflict_choose("none"), { desc = " Delete the conflict region" } },
					{ "n", "dX", actions.conflict_choose_all("none"), { desc = " Delete the conflicts for all" } },
					{ "n", "g?", actions.help({ "view", "diff2" }), { desc = " Open the help panel" } },
				},
				diff2 = {
					{ "n", "g?", actions.help({ "view", "diff2" }), { desc = " Open the help panel" } },
				},
				diff3 = {
					{ { "n", "x" }, "2do", actions.diffget("ours"), { desc = " Hunk `OURS` version" } },
					{ { "n", "x" }, "3do", actions.diffget("theirs"), { desc = " Hunk `THEIRS` version" } },
					{ "n", "g?", actions.help({ "view", "diff3" }), { desc = " Open the help panel" } },
				},
				diff4 = {
					-- Mappings in 4-way diff layouts
					{ { "n", "x" }, "1do", actions.diffget("base"), { desc = " Hunk `BASE` version" } },
					{ { "n", "x" }, "2do", actions.diffget("ours"), { desc = " Hunk `OURS` version" } },
					{ { "n", "x" }, "3do", actions.diffget("theirs"), { desc = " Hunk `THEIRS` version" } },
					{ "n", "g?", actions.help({ "view", "diff4" }), { desc = " Open the help panel" } },
				},
				file_panel = {
					{ "n", "j", actions.next_entry, { desc = "󰅴 Bring the cursor to the next file entry" } },
					{ "n", "k", actions.prev_entry, { desc = "󰅴 Bring the cursor to the previous file entry" } },
					{ "n", "<cr>", actions.select_entry, { desc = "󰕚 Diff for the selected entry" } },
					{ "n", "<tab>", actions.select_next_entry, { desc = "󰕚 Diff for the next file" } },
					{ "n", "<s-tab>", actions.select_prev_entry, { desc = "󰕚 Diff for the previous file" } },
					{ "n", "gp", actions.goto_file_edit, { desc = "󰅴 Open the file in the previous tab" } },
					{ "n", "gf", actions.goto_file_tab, { desc = "󰅴 Open the file in a new tab" } },
					{ "n", "i", actions.listing_style, { desc = "󰅴 Toggle between 'list' and 'tree' views" } },
					{ "n", "R", actions.refresh_files, { desc = "󰅴 Update stats and entries in the file list" } },
					{ "n", ",e", actions.focus_files, { desc = "󰅴 Bring focus to the file panel" } },
					{ "n", ",b", actions.toggle_files, { desc = "󰅴 Toggle the file panel" } },
					{ "n", ",l", actions.cycle_layout, { desc = "󰅴 Cycle available layouts" } },
					{ "n", "s", actions.toggle_stage_entry, { desc = " Stage / unstage the selected entry" } },
					{ "n", "S", actions.stage_all, { desc = " Stage all entries" } },
					{ "n", "U", actions.unstage_all, { desc = " Unstage all entries" } },
					{ "n", "X", actions.restore_entry, { desc = " Restore entry to the state" } },
					{ "n", "L", actions.open_commit_log, { desc = " Open the commit log panel" } },
					{ "n", ",cp", actions.prev_conflict, { desc = " Go to the previous conflict" } },
					{ "n", ",cn", actions.next_conflict, { desc = " Go to the next conflict" } },
					{ "n", ",cO", actions.conflict_choose_all("ours"), { desc = " Apply `OURS` version for all" } },
					{ "n", ",cT", actions.conflict_choose_all("theirs"), { desc = " Apply `THEIRS` for all" } },
					{ "n", ",cB", actions.conflict_choose_all("base"), { desc = " Apply `BASE` version for all" } },
					{ "n", ",cA", actions.conflict_choose_all("all"), { desc = " Apply ALL versions for all" } },
					{ "n", "dX", actions.conflict_choose_all("none"), { desc = " Delete the conflicts for all" } },
					{ "n", "g?", actions.help("file_panel"), { desc = " Open the help panel" } },
					{ "n", "zo", actions.open_fold, { desc = " Expand fold" } },
					{ "n", "zc", actions.close_fold, { desc = " Collapse fold" } },
					{ "n", "za", actions.toggle_fold, { desc = " Toggle fold" } },
					{ "n", "zR", actions.open_all_folds, { desc = " Expand all folds" } },
					{ "n", "zM", actions.close_all_folds, { desc = " Collapse all folds" } },
				},
				file_history_panel = {
					{ "n", "<cr>", actions.select_entry, { desc = " Diff for the selected entry." } },
					{ "n", "<tab>", actions.select_next_entry, { desc = " Diff for the next file" } },
					{ "n", "<s-tab>", actions.select_prev_entry, { desc = " Diff for the previous file" } },
					{ "n", "d", actions.open_in_diffview, { desc = " Open in a diffview" } },
					{ "n", "gf", actions.goto_file_tab, { desc = "󰅴 Open the file in a new tabpage" } },
					{ "n", "gp", actions.goto_file_edit, { desc = "󰅴 Open the file in the previous tabpage" } },
					{ "n", ",e", actions.focus_files, { desc = "󰅴 Bring focus to the file panel" } },
					{ "n", ",b", actions.toggle_files, { desc = "󰅴 Toggle the file panel" } },
					{ "n", ",l", actions.cycle_layout, { desc = "󰅴 Cycle available layouts" } },
					{ "n", "zR", actions.open_all_folds, { desc = " Expand all folds" } },
					{ "n", "zM", actions.close_all_folds, { desc = " Collapse all folds" } },
					{ "n", "I", actions.open_commit_log, { desc = " Show commit details" } },
					{ "n", "y", actions.copy_hash, { desc = "󰆏 Copy the commit hash" } },
					{ "n", "g?", actions.help("file_history_panel"), { desc = " Open the help panel" } },
					{ "n", "g!", actions.options, { desc = " Open the option panel" } },
				},
				option_panel = {
					{ "n", "<tab>", actions.select_entry, { desc = " Change the current option" } },
					{ "n", "q", actions.close, { desc = " Close the panel" } },
					{ "n", "g?", actions.help("option_panel"), { desc = " Open the help panel" } },
				},
				help_panel = {
					{ "n", "q", actions.close, { desc = " Close help menu" } },
					{ "n", "<esc>", actions.close, { desc = " Close help menu" } },
				},
			},
		})
	end,
}
