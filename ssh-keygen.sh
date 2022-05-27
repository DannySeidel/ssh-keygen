echo "Generating key with: '$1'"
ssh-keygen -t ed25519 -C "$1"
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
echo "Copying generated key to clipboard"
pbcopy < ~/.ssh/id_ed25519.pub
# add description
echo "Opening github..."
open https://github.com/settings/keys

