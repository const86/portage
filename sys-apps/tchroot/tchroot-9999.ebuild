# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git-2

DESCRIPTION="Transparent chroot tool"
HOMEPAGE="http://git.mimas.ru/?p=const/tchroot"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

EGIT_REPO_URI="git://git.mimas.ru/const/tchroot"

src_install() {
	dobin tchroot
	fperms 4711 /usr/bin/tchroot
	insinto /etc/tchroot
	doins "${FILESDIR}"/example
}
