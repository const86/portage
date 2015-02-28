# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit nsplugins toolchain-funcs

DESCRIPTION="Firefox ID card plugin"
HOMEPAGE="http://www.ria.ee/"
SRC_URI="https://installer.id.ee/media/ubuntu/pool/main/e/${PN}/${PN}_${PV}-ubuntu-13-10.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/openssl
	x11-libs/gtk+:2"

RESTRICT="mirror"
S="${WORKDIR}/${PN}"

src_compile() {
	make CC=$(tc-getCC) CPPFLAGS="${CPPFLAGS} ${CFLAGS} ${LDFLAGS}" plugin
}

src_install() {
	insinto /usr/$(get_libdir)/${PN}
	doins npesteid-firefox-plugin.so
	inst_plugin /usr/$(get_libdir)/${PN}/npesteid-firefox-plugin.so
}
