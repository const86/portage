# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit git-r3 cmake-multilib

DESCRIPTION="A tool for grabbing video from OpenGL powered applications"
HOMEPAGE="https://github.com/const86/glgrab"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="cuda egl ffmpeg"

RDEPEND="virtual/opengl[${MULTILIB_USEDEP}]
	egl? ( media-libs/mesa[egl,${MULTILIB_USEDEP}] )
	ffmpeg? ( media-video/ffmpeg:0=[${MULTILIB_USEDEP}] )
	cuda? ( dev-util/nvidia-cuda-toolkit )"

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
		$(cmake-utils_use_want cuda CUDA)
	)
	cmake-utils_src_configure
}
