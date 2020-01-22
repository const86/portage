# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python{2_7,3_6,3_7,3_8} )
PYTHON_REQ_USE="threads(+)"

inherit python-single-r1 waf-utils git-r3

DESCRIPTION="X(cross)platform Music Multiplexing System"
HOMEPAGE="http://xmms2.org/"

LICENSE="GPL-2 LGPL-2.1"
SLOT="0"
KEYWORDS=""
IUSE="aac airplay +alsa ao cdda curl cxx flac fluidsynth ffmpeg gme ices
jack libvisual mac +mad mlib-update mms modplug mp3 musepack ofa opus perl
pulseaudio python ruby samba +server sid sndfile speex tremor vocoder +vorbis
wavpack xml zeroconf"

RDEPEND="dev-libs/glib:2
	sys-libs/readline:0
	mlib-update? ( app-admin/gamin )
	cxx? ( dev-libs/boost )
	perl? ( dev-lang/perl )
	ruby? ( dev-lang/ruby:* )
	server? ( dev-db/sqlite:3
		aac? ( media-libs/faad2 )
		alsa? ( media-libs/alsa-lib )
		ao? ( media-libs/libao )
		zeroconf? ( net-dns/avahi )
		cdda? ( dev-libs/libcdio
			media-libs/libdiscid )
		curl? ( net-misc/curl )
		flac? ( media-libs/flac
			media-libs/libogg )
		fluidsynth? ( media-sound/fluidsynth )
		ffmpeg? ( virtual/ffmpeg )
		gme? ( media-libs/game-music-emu )
		jack? ( media-sound/jack-audio-connection-kit )
		libvisual? ( media-libs/libvisual:0.4
			media-plugins/libvisual-plugins:0.4
			media-libs/libsdl
			media-libs/libvorbis )
		mac? ( media-sound/mac )
		mad? ( media-libs/libmad )
		mms? ( media-libs/libmms )
		modplug? ( media-libs/libmodplug )
		mp3? ( >=media-sound/mpg123-1.5.1 )
		musepack? ( media-sound/musepack-tools )
		ofa? ( media-libs/libofa )
		opus? ( media-libs/libogg
				media-libs/opus )
		pulseaudio? ( media-sound/pulseaudio )
		samba? ( net-fs/samba )
		ices? ( media-libs/libvorbis
			media-libs/libogg
			media-libs/libshout )
		sid? ( media-libs/libsidplay:2 )
		sndfile? ( media-libs/libsndfile )
		speex? ( media-libs/libogg
			media-libs/speex )
		airplay? ( dev-libs/openssl:* )
		tremor? ( media-libs/tremor )
		vocoder? ( sci-libs/fftw:3.0
			media-libs/libsamplerate )
		vorbis? ( media-libs/libvorbis )
		wavpack? ( media-sound/wavpack )
		xml? ( dev-libs/libxml2 ) )"
DEPEND="${RDEPEND}
	dev-lang/python
	python? ( ${PYTHON_DEPS}
		dev-python/cython )"

EGIT_REPO_URI="git://git.xmms2.org/xmms2/xmms2-devel.git"

src_unpack() {
	git-r3_src_unpack "$@"
	cd "${S}"
	git submodule update --init
}

src_configure() {
	local conf oe od pe pd
	if use server; then
		pe="apefile,asf,asx,cue,diskwrite,equalizer,file,flv,gvfs,html"
		pe="${pe},icymetaint,id3v2,karaoke,m3u,mid1,midsquash,mp4,normalize"
		pe="${pe},null,nulstripper,oss,pls,replaygain,tta,wave,xml"
		pd="coreaudio,nms,sc68,sun,waveout"
		for p in alsa airplay ao ffmpeg:avcodec cdda curl \
			aac:faad flac fluidsynth gme ices jack mac \
			mad mms modplug mp3:mpg123 musepack ofa opus pulseaudio:pulse \
			xml:rss samba sid sndfile speex tremor vocoder vorbis \
			wavpack xml:xspf zeroconf:daap
		do
			use ${p/:*} && pe="${pe},${p/*:}" || pd="${pd},${p/*:}"
		done
		conf="${conf} --with-plugins=${pe} --without-plugins=${pd}"
	else
		conf="--without-xmms2d"
	fi
	oe="migrate-collections,nycli,pixmaps,s4,sqlite2s4"
	od="dns_sn,xmmsclient-ecore,xmmsclient-cf"
	for o in zeroconf:avahi server:et server:launcher \
		mlib-update:medialib-updater perl python ruby \
		libvisual:vistest cxx:xmmsclient++ cxx:xmmsclient++-glib
	do
		use ${o/:*} && oe="${oe},${o/*:}" || od="${od},${o/*:}"
	done
	conf="${conf} --without-optionals=${od} --with-optionals=${oe}"
	waf-utils_src_configure ${conf}
}

src_install() {
	waf-utils_src_install
	use python && python_optimize
}
