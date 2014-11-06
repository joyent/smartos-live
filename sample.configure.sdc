mkdir -p projects/local
(cd projects/local && [[ -d ur-agent ]] \
    || git clone git://github.com/joyent/sdc-ur-agent.git ur-agent)
(cd projects/local && [[ -d kvm ]] \
    || git clone git://github.com/joyent/illumos-kvm.git kvm)
(cd projects/local && [[ -d kvm-cmd ]] \
    || git clone git://github.com/joyent/illumos-kvm-cmd.git kvm-cmd)
(cd projects/local && [[ -d mdata-client ]] \
    || git clone git://github.com/joyent/mdata-client.git mdata-client)
(cd projects/local && [[ -d sdc-platform ]] \
    || git clone git://github.com/sdc-platform.git)
(cd overlay && [[ -d sdc ]] || \
    ln -s ../projects/local/sdc-platform/overlay sdc)

# default branch list if there isn't one
if [[ ! -f configure-branches ]]; then
    cat >configure-branches <<EOF
# after editing, rerun configure
illumos-live: master
illumos-extra: master
illumos-joyent: master
ur-agent: master
kvm: master
kvm-cmd: master
mdata-client: master
sdc-platform: master
EOF
fi

PUBLISHER="joyent"
RELEASE_VER="joyent_147"
SUNW_SPRO12_URL="https://download.joyent.com/pub/build/SunStudio.tar.bz2"
GCC44_URL="https://download.joyent.com/pub/build/gcc-4.tar.bz2"
ON_CLOSED_BINS_URL="https://download.joyent.com/pub/build/illumos/on-closed-bins.i386.tar.bz2"
ON_CLOSED_BINS_ND_URL="https://download.joyent.com/pub/build/illumos/on-closed-bins-nd.i386.tar.bz2"
GET_ILLUMOS="git clone git://github.com/joyent/illumos-joyent.git illumos"
GET_ILLUMOS_EXTRA="git clone git://github.com/joyent/illumos-extra.git illumos-extra"
ILLUMOS_ADJUNCT_TARBALL_URL="https://download.joyent.com/pub/build/adjuncts/"
OVERLAYS="sdc generic"
