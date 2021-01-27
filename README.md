# my-nvim
my nvim configuration

## Environment
WSL2 Ubuntu20.04
NeoVim 0.4.3

## Plugins
1. indentLine  
= = 忘了，但是不太重要，总之和缩进有关
2. vim-monokai  
颜色主题
3. coc-vim  
自动补全插件
4. nerdcommenter  
多行注释  
visual mode：`\`+`cc`注释，`\`+`cu`取消
5. markdown-preview  
markdown预览  
`:MarkdownPreview`预览，`:MarkdownPreviewStop`停止  
迷之配置，`localhost:port`并不能打开，但是`localhost:port/page/1`可以，多个文件则依次为1,2,3...
6. eleline.vim  
显示当前文件状态

## Useful Keys
`u`: undo  
`gg`: top  
`G`: bottom  
`V`: visual line  
`<up>/k` `<down>/j` `<left>/h` `<right>/l`: move cursor  (当然我选择直接`set mouse`)  
`:sp`: split window up/down  
`:vsp`: split window left/right  
`:tabe(dit)`: new tab  
`o`: new line and insert  
`y`: yank(copy)  
`p`: paste  
(WSL2可以直接在设置中选择应用`<C-c>`,`<C-v>`进行复制粘贴，再也无须考虑粘贴板的问题)  
`dd`: delete line  
`:w`: save  
`:q`: quit  
`/`: search, `n` jump to next  
`<shift>` + `<`/`>`: 多行缩进  

## Projections
`ter`: `:tabe` + `:term` 在新标签页中打开终端  
`ti`: `:-tabnext` 上一标签页  
`tn`: `:+tabnext` 下一标签页  
`<C-N>`: `<C-\>`+`<C-N>` 命令行 insert -> normal  
`<C-O>`: `<C-\>`+`<C-N>`+`<C-O>`+`:q` 关闭命令行  
`[g`: 上一个报错处  
`]g`: 下一个报错处  
`K`: 显示定义及其注释  
`<C-f>`: 下滚一页  
`<C-b>`: 上滚一页  
`gd`: 转到定义  
`gy`: 转到类型定义  
`gi`: 转到？  
`gr`: 转到引用  

## 一些tips
1. WSL2中访问浏览器的指令设置ip为`0.0.0.0`，如jupyter, jekyll, MarkdownPreview等，从而能在主机的浏览器中打开  
2. 直接使用WSL2的命令行，而非其他remote的方式，`set number`后右侧有部分内容被滑条遮挡，需要在设置中调整窗口宽度  
3. 本机GPU能够在WSL2中使用，但我不会且懒= =，[CUDA on WSL](https://docs.nvidia.com/cuda/wsl-user-guide/index.html)  
