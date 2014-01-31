# Vim config

## Install
Clone the repo (including vundle) and create a symlink
```bash
git clone --recursive https://github.com/tambourinecoder/dotvim.git
ln -s dotvim ~/.vim
```

Install plugins
```bash
vim --noplugin -u ~/.vim/vundles.vim -N "+set hidden" "+syntax on" +BundleClean! +BundleInstall +qall
cd ~/.vim/bundle/vimproc.vim && make
```

Profit!

## External dependencies
- [Ag (The Silver Searcher)](https://github.com/ggreer/the_silver_searcher)
- [reattach-to-user-namespace](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard)
- [pbcopy](https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/pbcopy.1.html)

## License
MIT
