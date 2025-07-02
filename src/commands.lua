local utils = require("utils")
local commands = {}

function commands.OUT(args, state)
    io.write(utils.smartResolve(args[2], state.memory))
end

function commands.NEWLINE(_, _)
    io.write("\n")
end

function commands.IN(args, state)
    local input = io.read()
    local num = tonumber(input)
    state.memory[args[2]] = num or input
end

function commands.OUTMEM(_, state)
    for k, v in pairs(state.memory) do
        io.write(k .. " = " .. tostring(v) .. "\n")
    end
end

function commands.JUMP(args, state)
    state.ip = tonumber(args[2])
    state.jumped = true
end

function commands.IFEQ(args, state)
    if utils.resolve(args[2], state.memory) == utils.resolve(args[3], state.memory) then
        state.ip = tonumber(args[4])
        state.jumped = true
    end
end

function commands.IFNEQ(args, state)
    if utils.resolve(args[2], state.memory) ~= utils.resolve(args[3], state.memory) then
        state.ip = tonumber(args[4])
        state.jumped = true
    end
end

function commands.IFGREATER(args, state)
    if utils.resolve(args[2], state.memory) > utils.resolve(args[3], state.memory) then
        state.ip = tonumber(args[4])
        state.jumped = true
    end
end

function commands.IFLESSER(args, state)
    if utils.resolve(args[2], state.memory) < utils.resolve(args[3], state.memory) then
        state.ip = tonumber(args[4])
        state.jumped = true
    end
end

function commands.SET(args, state)
    state.memory[args[2]] = utils.smartResolve(args[3], state.memory)
end

function commands.ADD(args, state)
    state.memory[args[2]] = utils.resolve(args[3], state.memory) + utils.resolve(args[4], state.memory)
end

function commands.SUB(args, state)
    state.memory[args[2]] = utils.resolve(args[3], state.memory) - utils.resolve(args[4], state.memory)
end

function commands.MULT(args, state)
    state.memory[args[2]] = utils.resolve(args[3], state.memory) * utils.resolve(args[4], state.memory)
end

function commands.DIV(args, state)
    state.memory[args[2]] = utils.resolve(args[3], state.memory) / utils.resolve(args[4], state.memory)
end

function commands.MOD(args, state)
    state.memory[args[2]] = utils.resolve(args[3], state.memory) % utils.resolve(args[4], state.memory)
end

function commands.POW(args, state)
    state.memory[args[2]] = utils.resolve(args[3], state.memory) ^ utils.resolve(args[4], state.memory)
end

function commands.CONCAT(args, state)
    state.memory[args[2]] = tostring(utils.smartResolve(args[3], state.memory)) .. tostring(utils.smartResolve(args[4], state.memory))
end

function commands.SETRANDINT(args, state)
    state.memory[args[2]] = math.random(utils.resolve(args[3], state.memory), utils.resolve(args[4], state.memory))
end

-- this is for comments, do not remove
function commands.REM()
    
end

function commands.QUIT()
    os.exit()
end

function commands.WAIT(args, state)
    local ms = utils.resolve(args[2], state.memory)
    local target = os.clock() + (ms / 1000)
    while os.clock() < target do end
end

return commands
