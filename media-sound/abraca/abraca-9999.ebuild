# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

VALA_MIN_API_VERSION="0.20"

inherit waf-utils vala git-2

DESCRIPTION="GTK3 XMMS2 client written in Vala, with focus on collections"
HOMEPAGE="http://abraca.xmms.se/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="media-sound/xmms2
	x11-libs/gtk+:3
	dev-libs/libgee:0"
DEPEND="${RDEPEND}
	$(vala_depend)"

EGIT_REPO_URI="git://github.com/Abraca/Abraca.git"
EGIT_HAS_SUBMODULES="true"
