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

RDEPEND="dev-libs/libdigidoc
	dev-libs/opensc
	dev-libs/openssl:0
	dev-libs/xerces-c
	dev-libs/xml-security-c
	sys-libs/zlib[minizip]"
DEPEND="${RDEPEND}
	dev-cpp/xsd"

DOCS="AUTHORS README"
S="${WORKDIR}/${PN}"

src_prepare() {
	rm -r src/minizip
	rm etc/certs/*
}

src_configure() {
	local mycmakeargs="${mycmakeargs} -DCMAKE_INSTALL_SYSCONFDIR=${EROOT}etc -DCERTS_LOCATION=${EROOT}etc/ssl/certs"
	cmake-utils_src_configure
}
