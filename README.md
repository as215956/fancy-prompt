# fancy-prompt

Fancy terminal prompt for bash used on debian based routers and service servers.


## Installation

Create opt directory

```bash
mkdir -p /opt/fancy-prompt
```

Download the Bash script

```bash
wget -O /opt/fancy-prompt/fancy-prompt.sh https://github.com/as215956/fancy-prompt/raw/main/fancy-prompt.sh
```

And source it in your .bashrc

```bash
source /opt/fancy-prompt/fancy-prompt.sh
```


## Troubleshoot

### Putty not showing symbols
Try using a nerdfont if you don't use it already.
If you are using a nerdfont try using 'FireCode Nerd Font Mono', else see other solutions

### Layout not working
It could be that your locales on the server isn't installed or working.

for debian:
```bash
apt update
apt install locales
dpkg-reconfigure locales
```

> After every solution try to reconnect your client or terminal to be sure the change took effect


