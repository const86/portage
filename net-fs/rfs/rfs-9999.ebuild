# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils git

DESCRIPTION="Remote Filesystem FUSE driver"
HOMEPAGE="http://git.mimas.ru/?p=const/rfs"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="sys-fs/fuse"
DEPEND="${RDEPEND}
	dev-libs/libxslt"

EGIT_REPO_URI="git://git.mimas.ru/const/rfs"

src_compile() {
	emake -C ipc || die "IPC build failed"
	emake -C rfs rfs || die "RFS build failed"
}

src_install() {
	dobin rfs/rfs
}
