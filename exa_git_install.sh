# Download exa zip
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip

sudo apt install unzip

mkdir /tmp/exa

# Unzip exa
unzip exa-linux-x86_64-v0.10.0.zip -d /tmp/exa

cp /tmp/exa/bin/exa /usr/local/bin

cp /tmp/exa/completions/exa.zsh /usr/local/share/zsh/site-functions/_exa

cp /tmp/exa/man/exa.1 /usr/share/man/man1

cp /tmp/exa/man/exa_colors.5 /usr/share/man/man5