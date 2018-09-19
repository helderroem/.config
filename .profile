cd $HOME/.shells/

os=$(uname -s)
folders=". $os"

# check what flavour of shell is running
if [ -n "$BASH_VERSION" ]; then
	folders="$folders bash"
fi

# On linux also look for distro specific files
if [ $os == 'Linux' ]; then
	source /etc/os-release
	folders="$folders $ID"
fi

# find all relevant dotfiles and load them
files=$(find $folders -maxdepth 1 -type f -name ".*")
for file in $files; do
	echo $file
	[ -r "$file" ] && [ -f "$file" ] && source "$HOME/.shells/$file";
done;

# cleanup
unset file;
unset files;
unset folders;
unset os;

cd -  > /dev/null 2>&1;
