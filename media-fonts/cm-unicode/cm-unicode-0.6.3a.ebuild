# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit font

DESCRIPTION="Computer Modern unicode OpenType fonts"
HOMEPAGE="http://canopus.iacp.dvo.ru/~panov/cm-unicode/"
SRC_URI="mirror://sourceforge/${PN}/${P}-otf.tar.gz
ftp://canopus.iacp.dvo.ru/pub/Font/${PN}/${P}-otf.tar.gz"

LICENSE="X11"
SLOT="0"
KEYWORDS="amd64 x86"

RESTRICT="mirror strip binchecks"

DOCS="Changes FAQ README TODO"

FONT_SUFFIX="otf"
