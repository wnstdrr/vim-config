bind = vim.opt 

-- Bind single method to a value
bindmap = function(method, value)
	bind[method] = value	
end

-- Bind multiple methods to a value
fbindmap = function(methods, value)
	for k, v in pairs(methods) do
		bindmap(v, value)
	end
end
