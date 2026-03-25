local M = {}
function M.create(image, x, y, width, height)
    local instance = {}
    instance.image = image
    instance.quad = love.graphics.newQuad(x, y, width, height, image)
    function instance:draw(x,y)
        love.graphics.draw(self.image, self.quad, x, y)
    end
    return instance
end
return M