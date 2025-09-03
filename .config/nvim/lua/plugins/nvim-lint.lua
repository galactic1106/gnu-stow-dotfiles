return {
	"mfussenegger/nvim-lint",
	opts = {
		linters = {
			phpcs = {
				cmd = "phpcs",
				stdin = false,
				args = {
					"--report=json",
					"--standard=PSR12",
					"--ignore=PEAR.Commenting.FileComment.Missing,PEAR.Commenting.ClassComment.Missing,PEAR.Commenting.FunctionComment.Missing,PEAR.Commenting.FunctionComment.MissingReturn",
				},
			},
		},
	},
}
