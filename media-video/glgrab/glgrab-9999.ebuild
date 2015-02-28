# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2 cmake-multilib

DESCRIPTION="A tool for grabbing video from OpenGL powered applications"
HOMEPAGE="https://github.com/const86/glgrab"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="egl ffmpeg"

RDEPEND=""
DEPEND="virtual/opengl
	egl? ( media-libs/mesa[egl] )
	ffmpeg? ( media-video/ffmpeg )"

EGIT_REPO_URI="git://github.com/const86/glgrab.git"

MULTILIB_CHOST_TOOLS=( /usr/bin/glgrab )

src_prepare() {
	use egl && MULTILIB_CHOST_TOOLS+=( /usr/bin/glgrab-egl )
	use ffmpeg && MULTILIB_CHOST_TOOLS+=( /usr/bin/glgrab-av )
}

multilib_src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_want egl EGL)
		$(cmake-utils_use_want ffmpeg FFMPEG)
	)
	cmake-utils_src_configure
}
