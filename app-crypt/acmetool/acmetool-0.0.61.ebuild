# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_VENDOR=(
	"github.com/alecthomas/template a0175ee"
	"github.com/alecthomas/units 2efee85"
	"github.com/coreos/go-systemd d219646" #v15
	"github.com/godbus/dbus 9764685"
	"github.com/hlandau/buildinfo 337a29b"
	"github.com/hlandau/dexlogconfig 244f29b"
	"github.com/hlandau/goutils 0cdb66a"
	"github.com/hlandau/xlog 197ef79"
	"github.com/jmhodges/clock 880ee4c"
	"github.com/mattn/go-isatty fc9e8d8"
	"github.com/mattn/go-runewidth 97311d9"
	"github.com/mitchellh/go-wordwrap ad45545"
	"github.com/ogier/pflag 45c278a"
	"github.com/peterhellberg/link 3eea38c"
	"github.com/satori/go.uuid 5bf94b6"
	"github.com/shiena/ansicolor a422bbe"
	"golang.org/x/crypto eb71ad9 github.com/golang/crypto"
	"golang.org/x/net 1c05540 github.com/golang/net"
	"golang.org/x/text cc24f03 github.com/golang/text"
	"gopkg.in/alecthomas/kingpin.v2 1087e65 github.com/alecthomas/kingpin" #v2.2.5
	"gopkg.in/cheggaaa/pb.v1 657164d github.com/cheggaaa/pb" #v1.0.18
	"gopkg.in/hlandau/configurable.v1 4149686 github.com/hlandau/configurable" #v1.0.1
	"gopkg.in/hlandau/easyconfig.v1 7589cb9 github.com/hlandau/easyconfig" #v1.0.16
	"gopkg.in/hlandau/service.v2 b64b346 github.com/hlandau/service" #v2.0.16
	"gopkg.in/hlandau/svcutils.v1 c25dac4 github.com/hlandau/svcutils" #v1.0.10
	"gopkg.in/square/go-jose.v1 aa2e30f github.com/square/go-jose" #v1.1.0
	"gopkg.in/tylerb/graceful.v1 4654dfb github.com/tylerb/graceful" #v1.2.15
	"gopkg.in/yaml.v2 eb3733d github.com/go-yaml/yaml" #v2
)
EGO_PN="github.com/hlandau/acme"

inherit golang-vcs-snapshot

DESCRIPTION="An automatic certificate acquisition tool for ACME (Let's Encrypt)"
HOMEPAGE="https://hlandau.github.io/acme/"
SRC_URI="https://${EGO_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="mirror strip"

src_compile() {
	GOPATH="${S}" go install -v \
		-ldflags "-s -w" ${EGO_PN}/cmd/${PN} || die
}

src_install() {
	dobin bin/${PN}
}

pkg_postinst() {
	einfo "See https://hlandau.github.io/acme/ for configuration guide."
}
