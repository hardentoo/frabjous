# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

EGO_VENDOR=(
	"github.com/beorn7/perks 4c0e845"
	"github.com/golang/protobuf 2402d76"
	"github.com/matttproud/golang_protobuf_extensions c12348c"
	"github.com/prometheus/client_golang c5b7fcc"
	"github.com/prometheus/client_model fa8ad6f"
	"github.com/prometheus/common dd2f054"
	"github.com/prometheus/procfs fcdb11c"
	"github.com/tomasen/fcgi_client b116e70"
)

inherit golang-vcs-snapshot systemd user

COMMIT_HASH="460c0d7d1bf8014b53df8d1f72fc0ee4a37dabb8"
EGO_PN="github.com/kumina/phpfpm_exporter"
DESCRIPTION="A Prometheus exporter for PHP-FPM"
HOMEPAGE="https://github.com/kumina/phpfpm_exporter"
SRC_URI="https://${EGO_PN}/archive/${COMMIT_HASH}.tar.gz -> ${P}.tar.gz
	${EGO_VENDOR_URI}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="mirror strip"

DOCS=( README.md )

G="${WORKDIR}/${P}"
S="${G}/src/${EGO_PN}"

pkg_setup() {
	enewgroup phpfpm_exporter
	enewuser phpfpm_exporter -1 -1 -1 phpfpm_exporter
}

src_compile() {
	export GOPATH="${G}"
	go build -v -ldflags "-s -w" || die
}

src_install() {
	dobin phpfpm_exporter
	einstalldocs

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
	systemd_dounit "${FILESDIR}"/${PN}.service

	diropts -o phpfpm_exporter -g phpfpm_exporter -m 0750
	dodir /var/log/phpfpm_exporter
}
