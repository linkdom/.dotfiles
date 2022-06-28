vim.fn.setreg('c', '{}kI//xxj')      -- comment block code
vim.fn.setreg('u', '{}kx.j')        -- uncomment block code
vim.fn.setreg('l', '0wi//')        -- comment line
vim.fn.setreg('z', '0wxx')        -- uncomment line
vim.fn.setreg('d', ':%bd|e#)        -- close all buffers except current one
