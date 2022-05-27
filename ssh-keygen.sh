echo "Generating key with: '$1'"
ssh-keygen -t ed25519 -C "$1"

eval "$(ssh-agent -s)"

# add ssh key dependent on os
if [ $(uname) = "Darwin" ]
then
	touch ~/.ssh/config
	echo -e "Host *\n		AddKeysToAgent yes\n		UseKeychain yes\n		IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config

	ssh-add --apple-use-keychain ~/.ssh/id_ed25519
else
	ssh-add ~/.ssh/id_ed25519
fi

unsupported=true

# choose preferred method
while [ "$unsupported" = true ]
do
	echo "Do you want to use the github-cli to add your key (y/n): "
	read method
	
	if [ "$method" == "y" ]
	then
		echo "Using github-cli to add your key..."
		gh ssh-key add ~/.ssh/id_ed25519.pub
		
		echo "Now you are using secure shell with your github account."
		unsupported=false
	
	elif [ "$method" == "n" ]
	then
		echo "Copying generated key to clipboard..."
		pbcopy < ~/.ssh/id_ed25519.pub
		
		echo "In the next step github.com will be opened."
		echo "Past the contents of your clipboard in the textbox with the title 'Key' and click 'Add SSH key'."
		echo "Now you are using secure shell with your github account."
		read -p "Press 'Enter' to continue."
		
		echo "Opening github..."
		if [ $(uname) = "Darwin" ]
		then
			open https://github.com/settings/ssh/new
		else
			xdg-open https://github.com/settings/ssh/new
		fi
		unsupported=false
	else
		echo "Unsupported input '$method'."
	fi
done

