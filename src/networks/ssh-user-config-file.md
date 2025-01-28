title: Improve your ssh config file
date: 2025-01-28

# SSH config file

It is a tedious to remember all the servers you manage by yourself, to remember the right port,
right address the user and so on. It can be challenging if you do not use domain name
for your just one server, at least because of IP addresses (hence domains come to the world).
It is not necessary to buy a domain immediately just for to remember what to write on CLI when
you want to connect via ssh. You can name your server locally thanks to your user ssh config file
located in `$HOME/.ssh/config`. The configuration support two basic things which make usage of your ssh
much more comfortable:

1. name your server by you (whatever name you want, the name is just use in local context of your ssh)
2. globbing (allow DRY, so you can write config more efficient, but sometimes it can lead to less legibility)

Below there is a example of the config file.

```terminal
# $HOME/.ssh/config

Host *
  AddKeysToAgent yes
  IgnoreUnknown UseKeychain
  IdentityFile ~/.ssh/your_private_key
  SetEnv TERM=xterm-256color

Host *my_server*
    User your_username
    Port ssh_port_on_your_server # if not used default 22

Host *my_server_ipv4
    HostName 49.49.49.49

Host *my_server_ipv6
    HostName 2a03:6000:95f1:607::17

Host ssh_socks5*
    DynamicForward 44444 # some your local port you want to use
    Compression yes
    SessionType none
    RequestTTY false

```

You can see in the example above how it works, after keyword of ssh config `Host` you can define name of server whatever you want. It is the name you will use in your terminal and it used just locally in context of your user and ssh. Furthermore you can use globbing so you can set what will be used for every server with `*`, the star match everything.

Then you can continue with playing with the globbing I can set just `username` and `port`, and then split address for ipv4 and ipv6, so the infortmation is not repeated. And also if I want to use `socks5` I can just add options which is required to do so for every server not just to `my_server`.

At the end you can connect via ssh just with a full name (full name means, the name which contains all required information), without to remember it. Just remember the right name you defined in config file :).

```terminal
ssh my_server_ipv4
```
