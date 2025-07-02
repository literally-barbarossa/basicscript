# 🧠 BasicScript

BasicScript is a simple [esolang](https://en.wikipedia.org/wiki/Esoteric_programming_language) inspired by BASIC. It's held together by duct tape and vibes. I honestly don't know if it's even Turing complete, and sometimes have seizures trying to write code in it, even though I'm *literally the dev.*

## ✨ Features

- Backslash(\) as a delimiter
- I/O with `IN` and `OUT`
- Variables with `SET`
- Loops and functions(kinda) with `JUMP`
- Conditionals with `IFEQ`, `IFNEQ`, `IFLESSER` and `IFGREATER`
- Miscellaneous commands like `QUIT` and `WAIT`
- Comments with `REM`
- Written entirely in Lua
- Not intended for production **at all.**

## 📦 Usage

### Without Adding BS To Your PATH (Not Recommended)

Using the .bat helper:

`start bs.bat example.bs`

Running from source:

`lua.exe main.lua example.bs`

### With Adding BS To Your PATH (Recommended)

First, download BS to your computer and place it anywhere, now open it in file explorer and copy the path by double-clicking the area left of the Search button and pressing Ctrl+C.

Press the Windows key on your computer and begin typing "Environment Variables"(or just search it from your search bar). When it shows "Edit the system environment variables", press Enter or click it. It should open up a window with the title "System Properties" and the "Advanced" tab selected. Now, click on the "Environment Variables" button in the bottom right. On the "User Variables for User" section, scroll down to find "path", it should be under the Variables column.

Double click path, and press the "New" button. Paste in your folder path for BS. Press "Okay" on all the windows you've opened.

Congrats, you've added BS to your PATH, which means you can now use it like this:

`bs example.bs`

And from anywhere on your computer!

### REPL

There's also a REPL you can use by running BS with the "repl" argument in the place of the file.