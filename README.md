# Justmake.nvim 🔧

**Simplify Your Workflow by using keymaps to makefile targets.**

## Requirements ⚙️

To use Justmake.nvim, ensure that you have [GNU make](https://www.gnu.org/software/make/) installed.

**Note:** Your project must have a `just.make` or `just.makefile` in the root directory.

## Installation 💻

Install Justmake.nvim via your preferred plugin manager, like [lazy.nvim](https://github.com/folke/lazy.nvim).

```lua
{ 'l3k4n/justmake.nvim' }
```

## Usage 🛠️
First set up your keymaps for each target:
```lua
local justmake = require("justmake")
justmake.setup()

vim.keymap.set('n', '<leader>mr', justmake.run, { desc = "Justmake: run" })
vim.keymap.set('n', '<leader>mb', justmake.build, { desc = "Justmake: build" })
vim.keymap.set('n', '<leader>mt', justmake.test, { desc = "Justmake: test" })
vim.keymap.set('n', '<leader>mc', justmake.clean, { desc = "Justmake: clean" })
```

And you're good to go! ✨

**Note 📝:** I would recommend adding `just.make` and `just.makefile` to your a `.gitignore`.

## Contributing 🚀
Contributions are welcome! If you encounter any issues or have suggestions for improvement, feel free to open an issue or submit a pull request. 
