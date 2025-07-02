local commands = require("commands")
local utils = require("utils")

local function runREPL()
    print("BasicScript REPL")

    local state = {
        memory = {},
        flags = {
            debug = false,
            trace = false
        }
    }

    while true do
        io.write("\nBS> ")
        local line = io.read()

        if not line then break end

        local parts = utils.split(line, "\\")
        local cmd = parts[1]

        if cmd == "QUIT" then
            print("Exiting BasicScript REPL.")
            break
        end

        if not cmd or cmd == "" then
            -- skip empty lines
        else
            local handler = commands[cmd]

            if not handler then
                print("Unknown command: " .. tostring(cmd))
            else
                local ok, err = pcall(function()
                    handler(parts, {
                        memory = state.memory,
                        flags = state.flags,
                        jumped = false,
                        ip = 1,
                        results = { parts }
                    })
                end)

                if not ok then
                    print("Error: " .. err)
                end
            end
        end
    end
end

return {
    runREPL = runREPL
}
