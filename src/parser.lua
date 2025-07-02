local parser = {}
local utils = require("utils")

function parser.parseFile(filepath)
    local results = {}
    for line in io.lines(filepath) do
        local parts = utils.split(line, "\\")
        table.insert(results, parts)
    end
    return results
end

return parser