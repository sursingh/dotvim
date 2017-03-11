
git submodule --quiet foreach 'echo $name' \
        | xargs -n1 -I{} git config --file .gitmodules submodule.{}.ignore untracked


git submodule --quiet foreach 'echo "doc/tags*" > $toplevel/.git/modules/$path/info/exclude'
