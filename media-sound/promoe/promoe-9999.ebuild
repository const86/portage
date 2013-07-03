# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit waf-utils git-2

DESCRIPTION="WinAMP2 skinable XMMS2 client"
HOMEPAGE="http://wiki.xmms2.xmms.se/index.php/Client:Promoe"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-sound/xmms2[cxx]
	dev-qt/qtcore:4
	dev-qt/qtgui:4"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="git://git.xmms.se/xmms2/${PN}.git"
