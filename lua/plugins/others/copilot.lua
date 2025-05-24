return {
	"github/copilot.vim",
	config = function()
		local env_path = vim.fn.stdpath("config") .. "/.env"
		local file = io.open(env_path, "r")
		if file then
			for line in file:lines() do
				local key, value = line:match("([^=]+)=([^\r\n]+)")
				if key and value and key == "PROXY" then
					vim.g.copilot_proxy = value
				end
			end
			file:close()
		end

		vim.cmd("Copilot enable")
	end,
}
