# SSH-keygen

[![macOS](https://svgshare.com/i/ZjP.svg)](https://svgshare.com/i/ZjP.svg)
[![Linux](https://svgshare.com/i/Zhy.svg)](https://svgshare.com/i/Zhy.svg)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)

This repo includes a bash script for automating the generation of a ssh-key for your github account.

## Steps

To start the script run:
```shell
bash ssh-keygen.sh your_email@example.com
```

I recommend that you use your **noreply.github.com** E-Mail.

When the script is called, it will generate a ssh-key with the given E-Mail.
It will use the default algorithm, which is Ed25519.
If not specified the key pair is stored at the default location (`~/.ssh/`).

Now the public key needs to be added to your github account.
The script provides two options.
If you have the github-cli installed, you can use it to add your key.
Otherwise the script will open the github website and you can paste your key in the provided textbox.
You will get detailed instructions while running the script.

Your sucessfully added a ssh-key to your github account!
For more information visit the official [github documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), which was used to write the script.

