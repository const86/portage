# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="1"

inherit base

MY_P="${P}DrLecter"
DESCRIPTION="X(cross)platform Music Multiplexing System"
HOMEPAGE="http://xmms2.xmms.se/"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="aac alsa ao avahi curl fam flac jack mad minimal mms modplug musepack
nocxx ofa perl pulseaudio python ruby samba shout sid ssl vocoder vorbis xml"

RDEPEND="dev-libs/glib:2
	fam? ( app-admin/gamin )
	!nocxx? ( dev-libs/boost )
	perl? ( dev-lang/perl )
	ruby? ( dev-lang/ruby )
	!minimal? ( dev-db/sqlite:3
		aac? ( media-libs/faad2 )
		alsa? ( media-libs/alsa-lib )
		ao? ( media-libs/libao )
		avahi? ( net-dns/avahi )
		curl? ( net-misc/curl )
		flac? ( media-libs/flac
			media-libs/libogg )
		jack? ( media-sound/jack )
		mad? ( media-libs/libmad )
		mms? ( media-libs/libmms )
		modplug? ( media-libs/libmodplug )
		musepack? ( media-libs/libmpcdec )
		ofa? ( media-libs/libofa )
		pulseaudio? ( media-sound/pulseaudio )
		samba? ( net-fs/samba )
		shout? ( media-libs/libvorbis
			media-libs/libogg
			media-libs/libshout )
		sid? ( media-sound/sidplay )
		ssl? ( dev-libs/openssl )
		vocoder? ( sci-libs/fftw:3.0
			media-libs/libsamplerate )
		vorbis? ( media-libs/libvorbis )
		xml? ( dev-libs/libxml2 ) )"
DEPEND="${RDEPEND}
	dev-lang/python
	python? ( dev-python/pyrex )"

S="${WORKDIR}/${MY_P}"
RESTRICT="mirror"

PATCHES=( "${FILESDIR}/0.5-gcc43.patch" )

src_compile() {
	local conf oe od pe pd
	if use minimal; then
		conf="--without-xmms2d=1"
	else
		pe="asf,asx,cue,diskwrite,equalizer,file,id3v2,icymetaint,karaoke"
		pe="${pe},m3u,mp4,normalize,null,nulstripper,pls,replaygain,wave,xml"
		pd="avcodec,cdda,coreaudio,gvfs,mac,nms,oss,waveout"
		for p in alsa ssl:airplay ao curl avahi:daap \
			aac:faad flac !nocxx:gme shout:ices jack curl:lastfm \
			curl:lastfmeta mad mms modplug musepack ofa pulseaudio:pulse \
			xml:rss samba vocoder vorbis xml:xspf; do
			use ${p/:*} && pe="${pe},${p/*:}" || pd="${pd},${p/*:}"
		done
		conf="${conf} --with-plugins=${pe} --without-plugins=${pd}"
	fi
	oe="cli,pixmaps"
	od="dns_sn,xmmsclient-ecore,xmmsclient-cf"
	for o in avahi !minimal:et !minimal:launcher fam:medialib-updater perl \
		python ruby !nocxx:xmmsclient++ !nocxx:xmmsclient++-glib
	do
		use ${o/:*} && oe="${oe},${o/*:}" || od="${od},${o/*:}"
	done
	conf="${conf} --without-optionals=${od} --with-optionals=${oe}"
	./waf --prefix=/usr --conf-prefix=/etc ${conf} configure \
		|| die "configure failed"
	./waf ${MAKEOPTS} build || die "build failed"
}

src_install() {
	./waf --destdir="${D}" install || die "install failed"
}
