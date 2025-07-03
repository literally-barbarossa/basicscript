# Reference

| Command                              | Args              | Description                                     |
| ------------------------------------ | ----------------- | ----------------------------------------------- |
| `SET`                                | `var` `value`     | Sets variable to number, string, or another var |
| `SETRANDINT`                         | `var` `min` `max` | Random int between min and max                  |
| `CONCAT`                             | `var` `a` `b`     | Concatenates two values as strings              |
| `ADD`/`SUB`/`MULT`/`DIV`/`MOD`/`POW` | `var` `a` `b`     | Math operations                                 |
| `IN`                                 | `var`             | Gets user input                                 |
| `OUT`                                | `value`           | Prints value                                    |
| `NEWLINE`                            | *(none)*          | Prints a newline                                |
| `OUTMEM`                             | *(none)*          | Prints current memory state                     |
| `JUMP`                               | `line`            | Sets the instruction pointer                    |
| `IFEQ`                               | `a` `b` `line`    | Jump if equal                                   |
| `IFNEQ`                              | `a` `b` `line`    | Jump if not equal                               |
| `IFGREATER`                          | `a` `b` `line`    | Jump if a > b                                   |
| `IFLESSER`                           | `a` `b` `line`    | Jump if a < b                                   |
| `WAIT`                               | `ms`              | Waits for X milliseconds                        |
| `QUIT`                               | *(none)*          | Ends program                                    |
| `REM`                                | `anything`        | Ignored                                         |

## Other
Backslashes are used as delimeters(e.g OUT\"Hello, World!).

If the input to a function starts with `"`, it's considered a string, if it's numeric, it's considered as a number, and if it's neither, then it will assume it's a variable.
