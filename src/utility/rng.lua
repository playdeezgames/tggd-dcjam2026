local M = {}
function M.fromGenerator(generator)
    local total = 0
    for _, v in pairs(generator) do
        total = total + v
    end
    local generated = love.math.random(0, total - 1)
    for k, v in pairs(generator) do
        if generated < v then
            return k
        else
            generated = generated - v
        end
    end
    return nil
end
function M.fromRange(minimum, maximum)
    return love.math.random(minimum, maximum)
end
return M