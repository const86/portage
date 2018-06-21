# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit cmake-utils

DESCRIPTION="Smart card manager UI application"
HOMEPAGE="http://ria.ee/"
SRC_URI="https://installer.id.ee/media/ubuntu/pool/main/q/${PN}/${PN}_${PV}-ubuntu-14-04.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"

RDEPEND="dev-libs/openssl:0
	dev-libs/opensc
	sys-apps/pcsc-lite
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5"
DEPEND="${RDEPEND}
	dev-qt/linguist-tools:5"

DOCS="AUTHORS README"
