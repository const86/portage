# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit git waf

DESCRIPTION="WinAMP2 skinable XMMS2 client"
HOMEPAGE="http://wiki.xmms2.xmms.se/index.php/Client:Promoe"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-sound/xmms2[cxx]
	x11-libs/qt-core:4
	x11-libs/qt-gui:4"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://git.xmms.se/xmms2/${PN}.git"
