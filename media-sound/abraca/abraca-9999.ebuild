# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python{2_5,2_6,2_7} )
VALA_MIN_API_VERSION="0.24"

inherit base python-any-r1 waf-utils vala git-r3

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
		base_src_prepare
		vala_src_prepare
}
