# Ansible vimrc

An Ansible role to install NeoVim with few plugins.

It needs Ansible community tasks:

```shell
ansible-galaxy collection install community.general
```

## Dependencies

- ⚠ Warning this install NodeJS & npm from the package manager. ⚠
- Install [Fzf](https://github.com/junegunn/fzf) and [Ag](https://github.com/ggreer/the_silver_searcher) for search

## Objectives

Full/seamless support for theses languages/syntax :

- Ruby/RoR
- HTML
- Javascript
- VueJS
- React
- Ansible
- JSON
- YAML
- Markdown
- C#

Target is to have **0 buggy behaviours**

### Theme & Font

Current theme is **slate** (desert, industry are also good) ; change it with `:colorscheme xxx` see available with `Tab`.

Current font is **MesloLGS NF Regular** (support emojis) set for [Zsh](https://github.com/Haelle/oh_my_zsh/)

### Plugins

Install plugins : `:PlugInstall` (already installed by Ansible)

### Navigation

Help : use `:help keycodes` to show vim keycode names

Possibility to navigate with splits, tabs & Tmux:

- `<C-w f>` : open in split
- `<C-w gf>` : open in tab
- `<C-⬅,⬆,⬇,➡>` : panel navigation
- `<C-w-⬅,⬆,⬇,➡>` : move panel
- `gt` : switch between vim tabs
- `<C-b>` : trigger [Tmux navigation](vim-tmux-navigator)

### Active functionalities

- `gd` : go to definition
- `gi` : go to implementation
- `gr` : navigate through references
- `gf` : go to file (only for Ruby/Rails)
- `gg=G` : reformat code
- `F2` : rename var / method / class
- `<C-k>` : show method definition
- `qf` : run linter fix - does not work well...
- `fr` : run formatter on the current line (not working on Solargraph/Ruby)
- `fa` : run formatter on the whole file
- `<C-o>` : back
- `<C-s>` : save
- `<C-space>` : trigger autocompletion engine
- `<tab>` : navigate through completion propositions
- `<C-c>` : comment / uncomment (line or selection)
- `bufdo!` : use `!` in order not to save the files (with this configuration it's mandatory...)

Ruby & Rails related :

- `<C-q>` : switch between Ruby spec and file
- `<C-w>t/s/l/a` run test/spec (file, nearest, last, all)

Other :

- suspend vim `Ctrl+z` and back with fg

### Automatic / passive functionalities

- spellchecking
- syntax hilighting
- auto lint in gutter & float window
- use 2 spaces for tab everywhere
- remember cusror position between sessions
- remove trailing lines on save
- trim whitespaces
- show all invisible characters
- highlight 'TODO/FIXME/XXX' keyword
- better resize vim
- add all type of pairs (), [] tag...
- add Ruby pairs (def/end, do/end)
- add Git infos in the gutter
- add linter infos in the gutter or with underline
- show method definition when available (use `<C-a>` and `<C-b>` to scroll after and before)

#### Search

Active:

- `<C-f>` : search in current file (basic vim)
- `<Shift-f>` : search through all files (using [fzf.vim / ag](https://github.com/junegunn/fzf.vim))
  - **Warning** : you may have to disable your terminal search to make it work
- `<Esc>` : cancel search (cancel hilighting)
- `<C-p>` : search file by name (using [fzf.vim](https://github.com/junegunn/fzf.vim))
  - `Enter` : open
  - `<C-t>` : open in new tab
  - `<C-x>` : open in horizontal split
  - `<C-v>` : open in vertical split

Passive:

- hilight results in **DarkGreen**
- hilight current selection with cursor blinking

### Sidebar (NerdTree)

#### Active

- `<C-n>` : open/close NerdTree
- `Enter` : open file
- `i` : open in horizontal split
- `s` : open in vertical split
- ... cf [NerdTree doc](...)

#### Passive

- icons for files
- symbols based on Git status
- ignore some folders (`node_modules`, `.gitignore`)

### Ruby - seeing is believing

`F4/F5/F6/F7` mark/run/mark&run/clear-marks code

### Conquer of Completion

Pluggins will install on first start.

For Solargraph you need to install it for each Ruby version you work with :

```vim
:InstallGems
```

Usefull commands :

- `:CocInfo`
- `:CocList commands`
- `:checkhealth`
- `:CocList extensions`
- ~~`:call CocAction('format')`~~
- `:CocList marketplace python`

Keep in mind [available extentions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions) :

- javascriptreact
- typescript
- typescriptreact
- typescript.tsx
- graphql

## Role Variables

No mandatory params, all params are in `defaults/main.yml`

## Example Playbook

```yaml
- hosts: locahost
  roles:
    - role: vimrc
      vim_user: foo
```

## Development usage

To run it locally create a symlink : `cd /etc/ansible/roles & sudo ln -s /path/to/vimrc .`

## License

BSD
