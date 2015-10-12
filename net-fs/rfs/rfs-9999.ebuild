# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils git-r3

DESCRIPTION="Remote Filesystem FUSE driver"
HOMEPAGE="https://github.com/const86/rfs"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="sys-fs/fuse"
DEPEND="${RDEPEND}
	dev-libs/libxslt"

EGIT_REPO_URI="git://github.com/const86/rfs.git"

src_compile() {
	emake -C ipc || die "IPC build failed"
	emake -C rfs rfs || die "RFS build failed"
}

src_install() {
	dobin rfs/rfs
}
