-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here


local opt = vim.opt
local state_dir = vim.fn.stdpath("state")  -- $XDG_STATE_HOME/nvim


-- 文件
opt.undofile = true
opt.undodir = state_dir .. "/undo//"
opt.undolevels = 10000

opt.directory = state_dir .. "/swap//"

opt.autoread = true -- 自动载入外部修改
-- autoread checktime
local autoread_checktime = vim.api.nvim_create_augroup("autoread_checktime", { clear = true })
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = autoread_checktime,
  callback = function()
    if vim.fn.mode() ~= "c" then
      vim.cmd("checktime")
    end
  end,
})


-- 编辑
opt.number = true -- 行号
opt.relativenumber = true -- 相对行号
local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })
local function set_relativenumber(enable)
  if vim.wo.number then
    vim.wo.relativenumber = enable
  end
end
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  group = numbertoggle,
  callback = function()
    set_relativenumber(false) -- 只保留绝对行号
  end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  group = numbertoggle,
  callback = function()
    set_relativenumber(true) -- 同时使用绝对行号和相对行号
  end,
})

opt.wrap = true -- 长行回绕，在下一行显示
opt.breakindent = true -- 保持缩进对齐
opt.showbreak = "↪ " -- 换行时在行首显示的符号

opt.whichwrap = "bs<>[]hl" -- 设置水平移动按键可以移动到上一行或下一行

opt.autoindent = true -- 根据上一行决定新行的缩进
opt.shiftround = true -- Round indent to multiple of 'shiftwidth'
opt.expandtab = true -- 按下<Tab>时插入空格。如果要插入<Tab>字符，需要按<CTRL-V>键，再按<Tab>键
opt.softtabstop = 4 -- 当expandtab被设置时，按下<Tab>或<BackSpace>时插入或删除的空格数
opt.shiftwidth = 4 -- >>、<<、==、自动缩进使用的缩进宽度。设置expandtab时，>>插入shiftwidth个空格
                   -- 设置noexpandtab时，>>插入混合的'\t'和空格，使得视觉宽度增加shiftwidth
opt.tabstop = 4 -- '\t'字符的显示宽度
-- Makefile必须使用真实Tab
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.softtabstop = 0
    vim.opt_local.shiftwidth = 8
    vim.opt_local.tabstop = 8
  end,
})

opt.list = true -- <Tab>显示为 ^I ，而 $ 显示在每行的结尾
opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "›",
  precedes = "‹",
} -- <Tab>显示为 → ，空格显示为 ·


-- 性能
opt.synmaxcol = 300 -- 只对前300列进行语法高亮，提升性能
-- 大文件保护
local LARGE_FILE_THRESHOLD = 5 * 1024 * 1024  -- 5 MB
local large_file = vim.api.nvim_create_augroup("LargeFile", { clear = true })
vim.api.nvim_create_autocmd("BufReadPre", {
  group = large_file,
  callback = function(args)
    local fname = args.file
    if not fname or fname == "" then return end

    local ok, stat = pcall(vim.loop.fs_stat, fname)
    if not ok or not stat then return end

    if stat.size <= LARGE_FILE_THRESHOLD then
      return
    end

    vim.b.largefile = true -- 标记为大文件，以便其他插件检测

    vim.opt_local.syntax = "off"
    vim.opt_local.current_syntax = nil
    vim.opt_local.filetype = "text"
    vim.opt_local.list = false
    vim.opt_local.undofile = false
    vim.opt_local.undolevels = -1
    vim.opt_local.swapfile = false
    if vim.treesitter then
      pcall(vim.treesitter.stop, args.buf)
    end
  end,
})
