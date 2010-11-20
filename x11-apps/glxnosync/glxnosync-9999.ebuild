# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools base git

DESCRIPTION="Implicitly call glXSwapIntervalMESA(0)"
HOMEPAGE="http://git.mimas.ru/?p=const/glxnosync"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="virtual/opengl"
DEPEND="${RDEPEND}"

EGIT_REPO_URI="git://git.mimas.ru/const/glxnosync"
EGIT_BOOTSTRAP="eautoreconf"
EXTRA_ECONF="--disable-static"
