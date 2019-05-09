# Load all the files in the enabled directory
for entry in `ls ~/.dotfiles/Aliases/Enabled`
do
    source ~/.dotfiles/Aliases/Enabled/$entry
done
