# Ansible vimrc

An Ansible role to install Vim with few plugins.

This role is based on https://github.com/amix/vimrc.

Update the conf with (create an alias ;) ; parenthesis are important :
```bash
(cd ~/.vim_runtime && git stash && git pull --rebase && git stash pop)
```

## Usages

### Rails navigation

- `gf`: goto file
- `o`: go back
- `<Ctrl+w>f`: open in split
- `<Ctrl+w>gf`: open in tab

In NerdTree:
- `<cr>`/`<Enter>`: open
- `i`: open in split horizontal
- `s`: open in split vertical

### Main shortcuts

- markdown folding: `za` open/close section
- NerdTree: `<,+nn>` open/close
- Rspec bindings: `<,+t/s/l/a>` to run spec on file/Single/Last/All
- seeing is believing: `F4/F5/F6` mark/run/mark&run code
- Ack: `Ack <keyword> <dir>` search through files
- Find: `<Ctrl+F>` find files by name
- Snipets: `Ctrl+J>` (see them with `:SnipMateOpenSnippetFiles`) (temporarly set back to `<Tab>` for tests)
- Comments: `gc, gcc, gcu`
- Swich between single-line to multi-line code `gJ/gS`
- quick replace: `<Ctr+n><Ctrl+n>cNewVarName`

### Automatic usage

- auto remove trailing spaces
- show all invisible characters
- auto resize vim
- auto add end tag in Ruby
- add Git indication on the left column

## Role Variables

No mandatory params, all params are in `defaults/main.yml`

## Example Playbook

```yaml
- hosts: locahost
  roles:
    - role: vimrc
```

## Development usage
To run it locally create a symlink : `cd /etc/ansible/roles & sudo ln -s /path/to/vimrc .`

## License

BSD
