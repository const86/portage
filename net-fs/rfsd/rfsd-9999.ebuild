# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils git-r3

DESCRIPTION="Remote Filesystem daemon"
HOMEPAGE="https://github.com/const86/rfs"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-libs/libxslt"
RDEPEND=""

EGIT_REPO_URI="git://github.com/const86/rfs.git"

src_compile() {
	emake -C ipc || die "IPC build failed"
	emake -C rfs rfsd || die "RFSd build failed"
}

src_install() {
	dobin rfs/rfsd
	newinitd "${FILESDIR}"/rfsd.initd rfsd
	newconfd "${FILESDIR}"/rfsd.confd rfsd
}
