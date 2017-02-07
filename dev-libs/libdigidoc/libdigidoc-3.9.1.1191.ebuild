# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit cmake-utils eutils

DESCRIPTION="DigiDoc digital signature library"
HOMEPAGE="http://ria.ee/"
SRC_URI="https://installer.id.ee/media/sources/${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-libs/libxml2
	dev-libs/openssl
	sys-libs/zlib"

RESTRICT="mirror"
DOCS="AUTHORS README"

src_prepare() {
	epatch "${FILESDIR}/${PN}-2.7.0-fix-compilation.patch"
}

src_configure() {
	local mycmakeargs="${mycmakeargs} -DCMAKE_INSTALL_SYSCONFDIR=${EROOT}etc"
	cmake-utils_src_configure
}
