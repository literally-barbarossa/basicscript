local utils = {}

function utils.split(str, sep)
    local t = {}
    for part in string.gmatch(str, "([^" .. sep .. "]+)") do
        table.insert(t, part)
    end
    return t
end

function utils.isString(val)
    return val:sub(1, 1) == "\""
end

function utils.isNumber(val)
    return tonumber(val) ~= nil
end

function utils.resolve(val, memory)
    local num = tonumber(val)
    if num then return num end
    if memory[val] == nil then
        error("Undefined variable or invalid value: " .. tostring(val))
    end
    return memory[val]
end

function utils.smartResolve(val, memory)
    if utils.isString(val) then
        return val:sub(2)
    elseif utils.isNumber(val) then
        return tonumber(val)
    elseif memory[val] ~= nil then
        return memory[val]
    else
        error("smartResolve failed: Unknown or unset variable '" .. tostring(val) .. "'")
    end
end

return utils