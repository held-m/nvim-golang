
require('formatter').setup({
  logging = true,
  filetype = {
	  go = {
		  function()
			  return {
				  exe = "gofmt",
				  args = {"-w"},
				  stdin = false
			  }
		  end
	  },
  }
})

