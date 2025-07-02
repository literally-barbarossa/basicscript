local function getScriptDir()
    local str = debug.getinfo(1, "S").source:sub(2)
    return str:match("(.+)[/\\].-%.lua$")
end

local scriptDir = getScriptDir()
package.path = scriptDir .. "/?.lua;" .. package.path

local parser = require("parser")
local runtime = require("runtime")
local repl = require("repl")

if arg[1] == "repl" then
    repl.runREPL()
    os.exit(0)
end

local args = {...}
local flags = {
    debug = false,
    trace = false,
    seed = nil,
    version = false,
    help = false
}

local function printHelp()
    print([[
BasicScript Interpreter - Help

Usage:
  lua main.lua <script.bs> [options]

Options:
  --debug        Show execution steps and memory per line
  --trace        Show all memory changes
  --seed <num>   Set a custom seed for math.random
  --version      Show BasicScript version
  --help         Print this message and exit

Docs:
  https://example.com/basic-script-docs
]])
end

local function printVersion()
    print("BasicScript v0.0.1 (Launch)")
end

-- Parse flags
local file
for i = 1, #args do
    local arg = args[i]
    if arg == "--debug" then
        flags.debug = true
    elseif arg == "--trace" then
        flags.trace = true
    elseif arg == "--seed" then
        local seed = tonumber(args[i + 1])
        if not seed then
            print("Error: --seed requires a number")
            os.exit(1)
        end
        flags.seed = seed
        i = i + 1
    elseif arg == "--version" then
        flags.version = true
    elseif arg == "--help" then
        flags.help = true
    elseif not arg:match("^%-%-") then
        file = arg
    end
end

-- Handle flags that exit
if flags.help then
    printHelp()
    os.exit(0)
end

if flags.version then
    printVersion()
    os.exit(0)
end

if not file then
    print("Error: No script file provided.\nUse --help for usage info.")
    os.exit(1)
end

if flags.seed then
    math.randomseed(flags.seed)
else
    math.randomseed(
        tonumber(tostring(os.time()):reverse()) + math.floor(os.clock() * 1e6)
    )
end

local results = parser.parseFile(file)
runtime.run(results, flags)
