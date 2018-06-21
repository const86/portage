# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"

inherit cmake-multilib

DESCRIPTION="A tool for grabbing video from OpenGL powered applications"
HOMEPAGE="https://github.com/const86/glgrab"
SRC_URI="https://github.com/const86/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="egl ffmpeg"

RDEPEND="virtual/opengl[${MULTILIB_USEDEP}]
	egl? ( media-libs/mesa[egl,${MULTILIB_USEDEP}] )
	ffmpeg? ( media-video/ffmpeg:0=[${MULTILIB_USEDEP}] )"

MULTILIB_CHOST_TOOLS=( /usr/bin/glgrab )

src_prepare() {
	use egl && MULTILIB_CHOST_TOOLS+=( /usr/bin/glgrab-egl )
	use ffmpeg && MULTILIB_CHOST_TOOLS+=(
			/usr/bin/glgrab-av
			/usr/bin/glgrab-export
		)
}

multilib_src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_want egl EGL)
		$(cmake-utils_use_want ffmpeg FFMPEG)
	)
	cmake-utils_src_configure
}
