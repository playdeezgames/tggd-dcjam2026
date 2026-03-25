local M = {}
function M.create(red, green, blue)
    local instance = {}
    instance.red = red
    instance.green = green
    instance.blue = blue
    function instance:getRGB()
        return self.red, self.green, self.blue
    end
    return instance
end
return M