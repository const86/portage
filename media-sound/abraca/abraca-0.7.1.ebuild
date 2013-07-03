# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit python

DESCRIPTION="GTK2 XMMS2 client written in Vala, with focus on collections"
HOMEPAGE="http://abraca.xmms.se/"
SRC_URI="mirror://github/Abraca/Abraca/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="media-sound/xmms2
	x11-libs/gtk+:3
	dev-libs/libgee:0"
DEPEND="${RDEPEND}
	dev-lang/vala:0.16"

pkg_setup() {
	python_set_active_version 2
}

src_compile() {
	./scons PREFIX=/usr VALAC=/usr/bin/valac-0.16 || die
}

src_install() {
	./scons DESTDIR="${D}" VALAC=/usr/bin/valac-0.16 install
}
