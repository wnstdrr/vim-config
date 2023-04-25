local B = { }

B.bind = vim.opt 

-- Bind single method to a value
B.bindmap = function(method, value)
	B.bind[method] = value	
end

-- Bind multiple methods to a value
B.fbindmap = function(methods, value)
	for _, v in pairs(methods) do
		B.bindmap(v, value)
	end
end

return B
