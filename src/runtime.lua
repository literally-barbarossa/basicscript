local commands = require("commands")
local utils = require("utils")

local function run(results, flags)
    local state = {
        ip = 1,
        jumped = false,
        memory = {},
        results = results,
        flags = flags or {}
    }

    local previousMemory = {}

    local function copyTable(t)
        local copy = {}
        for k, v in pairs(t) do copy[k] = v end
        return copy
    end

    while state.ip <= #state.results do
        local parts = state.results[state.ip]

        if not parts[1] or parts[1] == "" then
            state.ip = state.ip + 1
        else
            local cmd = parts[1]
            state.jumped = false

            if state.flags.debug then
                print("[DEBUG] Line " .. state.ip .. ": " .. table.concat(parts, " | "))
            end

            local handler = commands[cmd]
            if not handler then
                io.stderr:write("Error on line " .. state.ip .. ": Unknown command '" .. tostring(cmd) .. "'\n")
                os.exit(1)
            end

            previousMemory = copyTable(state.memory)

            local ok, err = pcall(function()
                handler(parts, state)
            end)

            if not ok then
                io.stderr:write("Runtime error on line " .. state.ip .. ": " .. err .. "\n")
                os.exit(1)
            end

            if state.flags.trace then
                for k, v in pairs(state.memory) do
                    if previousMemory[k] ~= v then
                        print("[TRACE] " .. k .. " = " .. tostring(v))
                    end
                end
            end

            if state.flags.debug then
                print("[DEBUG] Memory:")
                for k, v in pairs(state.memory) do
                    print("    " .. k .. " = " .. tostring(v))
                end
            end

            if not state.jumped then
                state.ip = state.ip + 1
            end
        end
    end
end

return {
    run = run
}
