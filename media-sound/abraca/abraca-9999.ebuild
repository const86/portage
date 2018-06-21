# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )
PYTHON_REQ_USE="threads(+)"

VALA_MIN_API_VERSION="0.32"
VALA_MAX_API_VERSION="0.34"

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
		vala_src_prepare
}
