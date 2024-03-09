# Download exa zip
wget https://github.com/ogham/exa/releases/download/v0.10.0/exa-linux-x86_64-v0.10.0.zip

sudo apt install unzip

mkdir /tmp/exa

# Unzip exa
unzip exa-linux-x86_64-v0.10.0.zip -d /tmp/exa

cp /tmp/exa/exa /usr/local/bin

cp /tmp/completions/exa.zsh /usr/local/share/zsh/site-functions/_exa

cp /tmp/man/exa.1 /usr/share/man/man1

cp /tmp/man/exa /usr/share/man/man5/exa_colors.5