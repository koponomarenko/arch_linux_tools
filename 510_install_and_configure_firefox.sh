#!/bin/bash
. functions.sh

pkgs=(firefox)

. common_install_and_configure.sh

install_pkgs

# Make Firefox use Wayland by default
# TODO: maybe set "GDK_BACKEND=wayland" globally instead
firefox_wayland="/usr/local/bin/firefox"
cmd_do 'cat >${firefox_wayland} <<EOF
#!/bin/sh
GDK_BACKEND=wayland exec /usr/bin/firefox "\$@"
EOF'
cmd_do chmod +x "${firefox_wayland}"
