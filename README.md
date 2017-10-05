## _Welcome to the frabjous Gentoo overlay!_ [<img src="https://travis-ci.org/csmk/frabjous.svg?branch=master" title="Build Status" alt="Build Status" align="right">](https://travis-ci.org/csmk/frabjous)

This overlay contains many ebuilds for packages related to cryptography, system monitoring,
server-side applications and tools, web servers, and other things that I'm interested in.
It also include support for the upcoming `libressl` USE flag.

If you find any bugs, please report them! I'm also happy to accept pull requests
from anyone. You can use the [GitHub issue tracker](https://github.com/csmk/frabjous/issues)
to report bugs, ask questions or suggest new features.

**DISCLAIMER:** As I don't have the resources, nor the time to make stable ebuilds
in the same way Gentoo developers do, all ebuilds are permanently kept in the _testing¹_
branch. As such, you should probably consider it to be _unsafe_ and treat it as such.
Nevertheless, I try my best to follow Gentoo's QA standards and keep everything up to date,
as I use many of these packages in a production environment.

> ¹ *If a package is in testing, it means that the developers feel that it is functional,
but has not been thoroughly tested. Users using the testing branch might very well be the
first to discover a bug in the package in which case they should file a bug report to let
the developers know about it.* —
[Gentoo's Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Portage#Testing) ↩

## How to install the overlay
You must have `app-portage/layman` installed on your system for this to work. Just
run `layman -a frabjous`, then you will be _almost¹_ ready to emerge the goodies.

Alternatively, you can use it by adding this in `/etc/portage/repos.conf/frabjous.conf`:

```ini
[frabjous]
priority = 50
location = /usr/local/overlay/frabjous
sync-type = git
sync-uri = https://github.com/csmk/frabjous.git
auto-sync = Yes
```

> ¹ To use the testing branch for particular packages, you must add the package category and name
(e.g., foo-bar/xyz) in `/etc/portage/package.accept_keywords`. It is also possible to create a directory
(with the same name) and list the package in the files under that directory. ↩

## Repository tree
This is a list of packages available and their associated description:

Package | Description
--- | ---
app-admin/**[doctl](app-admin/doctl)** | A command line tool for DigitalOcean services
app-admin/**[pick](app-admin/pick)** | A minimal password manager written in Go
app-admin/**[scaleway-cli](app-admin/scaleway-cli)** | Interact with Scaleway API from the command line
app-arch/**[squash](app-arch/squash)** | Compression abstraction library and utilities
app-backup/**[restic](app-backup/restic)** | A backup program that is fast, efficient and secure
app-backup/**[zvault](app-backup/zvault)** | A highly efficient deduplicating backup solution
app-benchmarks/**[bombardier](app-benchmarks/bombardier)** | Fast cross-platform HTTP benchmarking tool written in Go
app-benchmarks/**[hey](app-benchmarks/hey)** | HTTP load generator, ApacheBench (ab) replacement
app-benchmarks/**[vegeta](app-benchmarks/vegeta)** | HTTP load testing tool and library. It's over 9000!
app-crypt/**[acmetool](app-crypt/acmetool)** | An automatic certificate acquisition tool for ACME (Let's Encrypt)
app-crypt/**[enchive](app-crypt/enchive)** | A tool to encrypt files to yourself for long-term archival
app-crypt/**[minisign](app-crypt/minisign)** | A dead simple tool to sign files and verify digital signatures
app-crypt/**[opmsg](app-crypt/opmsg)** | opmsg message encryption (an alternative to GnuPG)
app-crypt/**[ssh-vault](app-crypt/ssh-vault)** | Encrypt/Decrypt using SSH private keys
app-editors/**[micro](app-editors/micro)** | A modern and intuitive terminal-based text editor
app-misc/**[gomatrix](app-misc/gomatrix)** | Connects to The Matrix and displays it's data streams in your terminal
dev-db/**[influxdb](dev-db/influxdb)** | Scalable datastore for metrics, events, and real-time analytics
dev-db/**[pgweb](dev-db/pgweb)** | Web-based PostgreSQL database browser written in Go
dev-db/**[orchestrator](dev-db/orchestrator)** | A MySQL high availability and replication management tool
dev-db/**[tidb](dev-db/tidb)** | A distributed NewSQL database compatible with MySQL protocol
dev-go/**[depth](dev-go/depth)** | Retrieve and visualize Go source code dependency trees
dev-libs/**[univalue](dev-libs/univalue)** | C++ universal value object and JSON library
dev-util/**[electron](dev-util/electron)** | Cross platform application development framework based on web technologies
dev-vcs/**[hub](dev-vcs/hub)** | A command-line wrapper for git that makes you better at GitHub
gnome-extra/**[gnome-pomodoro](gnome-extra/gnome-pomodoro)** | A Pomodoro timer for Gnome
gnome-extra/**[nautilus-git](gnome-extra/nautilus-git)** | Nautilus extension to add important information about the current git directory
media-tv/**[tv-renamer](media-tv/tv-renamer)** | A TV series renaming application written in Rust
media-video/**[curlew](media-video/curlew)** | Easy to use and Free Multimedia Converter for Linux
media-video/**[gnome-mpv](media-video/gnome-mpv)** | A simple GTK+ frontend for mpv
media-video/**[peek](media-video/peek)** | Simple animated GIF screen recorder with an easy to use interface
net-analyzer/**[goaccess](net-analyzer/goaccess)** | A real-time web log analyzer and interactive viewer that runs in a terminal
net-analyzer/**[kapacitor](net-analyzer/kapacitor)** | A framework for processing, monitoring, and alerting on time series data
net-analyzer/**[prometheus](net-analyzer/prometheus)** | The Prometheus monitoring system and time series database
net-analyzer/**[prometheus](net-analyzer)-*** | Too many to list here; see `net-analyzer` category, they are self explanatory
net-analyzer/**[telegraf](net-analyzer/telegraf)** | An agent for collecting, processing, aggregating, and writing metrics
net-analyzer/**[wuzz](net-analyzer/wuzz)** | Interactive cli tool for HTTP inspection
net-dns/**[dnscrypt-proxy](net-dns/dnscrypt-proxy)** | A tool for securing communications between a client and a DNS resolver
net-dns/**[dnscrypt-wrapper](net-dns/dnscrypt-wrapper)** | A server-side DNSCrypt proxy
net-dns/**[knot-resolver](net-dns/knot-resolver)** | A caching full DNS resolver implementation written in C and LuaJIT
net-dns/**[knot](net-dns/knot)** | High-performance authoritative-only DNS server
net-dns/**[unbound](net-dns/unbound)** | A validating, recursive and caching DNS resolver
net-firewall/**[firehol](net-firewall/firehol)** | A firewall for humans...
net-im/**[dino](net-im/dino)** | A modern Jabber/XMPP Client using GTK+/Vala
net-libs/**[nodejs](net-libs/nodejs)** | A JavaScript runtime built on Chrome's V8 JavaScript engine
net-libs/**[wslay](net-libs/wslay)** | The WebSocket library written in C
net-misc/**[gotty-client](net-misc/gotty-client)** | A terminal client for GoTTY
net-misc/**[pget](net-misc/pget)** | A parallel file download client in Go
net-misc/**[ssh-chat](net-misc/ssh-chat)** | A chat over SSH server written in Go
net-misc/**[piknik](net-misc/piknik)** | Copy/paste anything over the network
net-misc/**[tinyssh](net-misc/tinyssh)** | A small SSH server with state-of-the-art cryptography
net-news/**[feedreader](net-news/feedreader)** | A modern desktop application designed to complement web-based RSS accounts
net-p2p/**[Sia](net-p2p/Sia)** | Blockchain-based marketplace for file storage
net-p2p/**[bitcoin-abc](net-p2p/bitcoin-abc)** | A full node Bitcoin Cash implementation with GUI, daemon and utils
net-p2p/**[bitcoincash-wallet](net-p2p/bitcoincash-wallet)** | A Bitcoin Cash P2P SPV Wallet
net-p2p/**[bitcoin-classic](net-p2p/bitcoin-classic)** | A full node Bitcoin (or Bitcoin Cash) implementation with GUI, daemon and utils
net-p2p/**[bitcoin-unlimited](net-p2p/bitcoin-unlimited)** | A full node Bitcoin implementation with GUI, daemon and utils
net-p2p/**[bitcoinxt](net-p2p/bitcoinxt)** | A full node Bitcoin Cash implementation with GUI, daemon and utils
net-p2p/**[bucash](net-p2p/bucash)** | A full node Bitcoin Cash implementation with GUI, daemon and utils
net-p2p/**[dash-core](net-p2p/dash-core)** | A peer-to-peer privacy-centric digital currency
net-p2p/**[drops](net-p2p/drops)** | A p2p transport network for opmsg end2end encrypted messages
net-p2p/**[parity](net-p2p/parity)** | Fast, light, and robust Ethereum client
net-p2p/**[monero](net-p2p/monero)** | The secure, private and untraceable cryptocurrency
net-p2p/**[monero-core](net-p2p/monero-core)** | The secure, private and untraceable cryptocurrency (with GUI wallet)
net-p2p/**[zcash](net-p2p/zcash)** | Cryptocurrency that offers privacy of transactions
net-proxy/**[shadowsocks-go](net-proxy/shadowsocks-go)** | A Go port of Shadowsocks
net-proxy/**[shadowsocks-rust](net-proxy/shadowsocks-rust)** | A Rust port of Shadowsocks
net-proxy/**[toxiproxy](net-proxy/toxiproxy)** | A TCP proxy to simulate network and system conditions
net-vpn/**[vpncloud](net-vpn/vpncloud)** | A fully-meshed VPN network in a peer-to-peer manner
sys-apps/**[exa](sys-apps/exa)** | A replacement for 'ls' written in Rust
sys-apps/**[yarn](sys-apps/yarn)** | Fast, reliable, and secure node dependency management
sys-fs/**[gocryptfs](sys-fs/gocryptfs)** | Encrypted overlay filesystem written in Go
sys-fs/**[tmsu](sys-fs/tmsu)** | Files tagger and virtual tag-based filesystem
sys-process/**[gkill](sys-process/gkill)** | An interactive process killer
www-apps/**[chronograf](www-apps/chronograf)** | Open source monitoring and visualization UI for the TICK stack
www-apps/**[filemanager](www-apps/filemanager)** | A stylish web file manager
www-apps/**[gitea](www-apps/gitea)** | Gitea - Git with a cup of tea
www-apps/**[gogs](www-apps/gogs)** | A painless self-hosted Git service
www-apps/**[gotty](www-apps/gotty)** | A simple command line tool that turns your CLI tools into web applications
www-apps/**[grafana](www-apps/grafana)** | Grafana is an open source metric analytics & visualization suite
www-apps/**[hiawatha-monitor](www-apps/hiawatha-monitor)** | Monitoring application for www-servers/hiawatha
www-apps/**[hugo](www-apps/hugo)** | A static HTML and CSS website generator written in Go
www-apps/**[mattermost-server](www-apps/mattermost-server)** | Open source Slack-alternative in Golang and React
www-apps/**[spreed-webrtc](www-apps/spreed-webrtc)** | A WebRTC audio/video call and conferencing server and web client
www-apps/**[wekan](www-apps/wekan)** | The open-source Trello-like kanban
www-client/**[inox](www-client/inox)** | Chromium spin-off to enhance privacy by disabling data transmission to Google
www-plugins/**[browserpass](www-plugins/browserpass)** | WebExtension host binary for app-admin/pass, a UNIX password manager
www-servers/**[algernon](www-servers/algernon)** | Pure Go web server with built-in Lua, Markdown, HyperApp and Pongo2 support
www-servers/**[caddy](www-servers/caddy)** | Fast, cross-platform HTTP/2 web server with automatic HTTPS
www-servers/**[h2o](www-servers/h2o)** | An optimized HTTP server with support for HTTP/1.x and HTTP/2
www-servers/**[hiawatha](www-servers/hiawatha)** | Advanced and secure webserver
www-servers/**[nginx](www-servers/nginx)** | Robust, small and high performance http and reverse proxy server
www-servers/**[rest-server](www-servers/rest-server)** | A high performance HTTP server that implements restic's REST backend API
x11-apps/**[radeon-profile](x11-apps/radeon-profile)** | App for display info about radeon card
x11-apps/**[radeon-profile-daemon](x11-apps/radeon-profile-daemon)** | Daemon for radeon-profile GUI
x11-misc/**[noti](x11-misc/noti)** | Trigger notifications when a process completes

All commits are signed with the key ID `A6C7CA717170C3FD`. The key fingerprint is
[`10E4 B84B FAB9 3923 F181 695F B0E3 361B A998 2E58`](https://keybase.io/csmk).

## Donations are welcome!
* Bitcoin _Cash_: `18RsspfceUbXEqgzx29DuZYafZVDgM4F4g`
* Dash: `Xg8AVx7YLSpTagR5DSzHk9Na1oDMUwb2hk`
* Ether: `0x002e7A11013BF05D418FD3FbdA4f3381E82e5A23`
* Zcash: `zcX1qbN2YJKARPmFcrU3HgpQfYbWe9yy4YsogDA4gpwJ6NGk2bXZ6nyNDo3HLBkAKizRPkASSEduGeVtzj3VfixFey9y1Yx`
* Monero:

`4KseVC8hDgP27ata3RuhyFbr1YMYn24hKDQixKTiQTufGX6Fn9vYTsvNY3uaZwivEQXXeewBk6d8eFymEGCU8pArN5m8JxkAcAu5CQRwat`
