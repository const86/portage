# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="1"

inherit python git

DESCRIPTION="GTK2 XMMS2 client written in Vala, with focus on collections"
HOMEPAGE="http://abraca.xmms.se/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-sound/xmms2
	x11-libs/gtk+:3
	dev-libs/libgee:0"
DEPEND="${RDEPEND}
	dev-lang/vala:0.14"

EGIT_REPO_URI="git://git.xmms.se/xmms2/${PN}.git"

pkg_setup() {
	python_set_active_version 2
}

src_compile() {
	./scons PREFIX=/usr VALAC=valac-0.14 || die
}

src_install() {
	./scons DESTDIR="${D}" VALAC=valac-0.14 install
}
