# Neovim Config
适于 OIers 的 [neovim](https://github.com/neovim/neovim) 配置。

## 安装此配置后你需要做的事

- [ ] 安装 `python >= 3.5`、`gcc >= 7`、`g++ >= 7`、`clangd >= 11`、`go >= 1.16`
- [ ] 安装 `pynvim`（`pip install --user pynvim` 或 `pacman -S python-neovim`）
- [ ] 安装 `nodejs` 和 `npm`，然后在终端输入 `npm install -g neovim`

## 安装此配置后推荐你做的事

- [ ] 执行 `:checkhealth`
- [ ] 查看 `_machine_specific.vim` 文件
- [ ] 安装 [`fzf`](https://github.com/junegunn/fzf) 来模糊查找文件
- [ ] 安装 [`lf`](https://github.com/gokcehan/lf)，一个终端下的文件管理器
- [ ] 安装 [`cf-tool`](https://github.com/xalanq/cf-tool) 来把你的代码交到 codeforces 上
- [ ] 在你的浏览器上安装 [`Competitive Companion`](https://github.com/jmerle/competitive-companion) 插件来获取各大 OJ 的样例数据

## 快捷键

### 1 基础编辑器特性

#### 1.1 改变了的光标移动方式

| 快捷键       | 行为                       | 等于  |
| ------------ | -------------------------- | ----- |
| `H`          | 将光标移到前一个单词的开头 | `b`   |
| `J`          | 将光标向下移动五行         | `5j`  |
| `K`          | 将光标向上移动五行         | `5k`  |
| `L`          | 将光标移到后一个单词的开头 | `w`   |
| `N`          | 将光标移到前一个单词的末尾 | `be`  |
| `n`          | 将光标移到当前单词的末尾   | `e`   |
| `*`          | 移动到行首（不含空白）     | `^`   |
| `^`          | 移动到行首                 | `0`   |
| `-`          | 上一个搜索项               | `Nzz` |
| `=`          | 下一个搜索项               | `nzz` |
| `'`          | 下一个重复单词             | `*zz` |
| `ctrl` + `'` | 上一个重复单词             | `#zz` |

#### 1.2 改变了在普通模式下的操作键位

| 快捷键          | 行为             |
| --------------- | ---------------- |
| `<`             | 反向缩进         |
| `>`             | 缩进             |
| `space` `space` | 选中一个单词     |
| `+`             | 自增光标下的数字 |
| `-`             | 自减光标下的数字 |
| `;`             | 打开命令行       |

> 部分普通模式键位在可视模式仍有效。

### 2 窗口管理

#### 2.1 通过分裂屏幕创造窗口

| 快捷键          | 行为                                   |
| --------------- | -------------------------------------- |
| `space` `s` `k` | 新建一个分屏并把它放置在当前窗口的上面 |
| `space` `s` `j` | 新建一个分屏并把它放置在当前窗口的下面 |
| `space` `s` `h` | 新建一个分屏并把它放置在当前窗口的左边 |
| `space` `s` `l` | 新建一个分屏并把它放置在当前窗口的右边 |

#### 2.2 切换不同的窗口

| 快捷键        | 行为           |
| ------------- | -------------- |
| `space` + `w` | 移至下一个窗口 |
| `space` + `n` | 移至左边的窗口 |
| `space` + `i` | 移至右边的窗口 |
| `space` + `u` | 移至上面的窗口 |
| `space` + `e` | 移至下面的窗口 |

#### 2.3 为不同的窗口调整大小

用 `ctrl` + `h` / `j` / `k` / `l` 更改当前窗口的大小。

### 3 标签页管理

| 快捷键       | 行为           |
| ------------ | -------------- |
| `ctrl` + `e` | 移至左侧标签页 |
| `ctrl` + `r` | 移至右侧标签页 |

### 4 终端键盘快捷键

| 快捷键       | 行为             |
| ------------ | ---------------- |
| `ctrl` + `n` | 退出终端输入模式 |

## 插件

// TODO

