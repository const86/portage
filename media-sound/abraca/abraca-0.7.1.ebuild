# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_5,2_6,2_7} )

inherit python-any-r1 vala

DESCRIPTION="GTK2 XMMS2 client written in Vala, with focus on collections"
HOMEPAGE="http://abraca.xmms.se/"
SRC_URI="mirror://github/Abraca/Abraca/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

VALA_MIN_API_VERSION="0.16"
VALA_MAX_API_VERSION="0.16"

RDEPEND="media-sound/xmms2
	x11-libs/gtk+:3
	dev-libs/libgee:0"
DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	$(vala_depend)"

src_compile() {
	./scons PREFIX=/usr || die "build failed"
}

src_install() {
	./scons DESTDIR="${D}" install || die "install failed"
}
