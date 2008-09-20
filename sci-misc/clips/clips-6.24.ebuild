# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

DESCRIPTION="A Tool for Building Expert Systems"
HOMEPAGE="http://clipsrules.sourceforge.net/"
SRC_URI="mirror://sourceforge/clipsrules/clips_core_source_624.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

RESTRICT="mirror"

S="${WORKDIR}/CLIPSSrc"

src_compile() {
	emake -f "${FILESDIR}/Makefile" || die
}

src_install() {
	dobin clips
}
