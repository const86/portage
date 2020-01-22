# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6,3_7} )
PYTHON_REQ_USE="threads(+)"

VALA_MIN_API_VERSION="0.36"
VALA_MAX_API_VERSION="0.44"

inherit python-any-r1 waf-utils vala git-r3

DESCRIPTION="GTK3 XMMS2 client written in Vala, with focus on collections"
HOMEPAGE="http://abraca.xmms.se/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=">=media-sound/xmms2-0.8
	>=x11-libs/gtk+-3.12:3
	>=dev-libs/libgee-0.10.5:0.8"
DEPEND="${RDEPEND}
	$(vala_depend)"

EGIT_REPO_URI="git://github.com/Abraca/Abraca.git"

src_prepare() {
		default
		epatch "${FILESDIR}/0001-Fix-build-breaks-against-Vala-0.36.patch"
		epatch "${FILESDIR}/0002-Fix-build-breaks-against-Vala-0.44.patch"
		vala_src_prepare
}
