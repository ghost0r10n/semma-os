nix-shell -p \
  'python312.withPackages (ps: [ ps.pygobject3 ])' \
  gtk3 webkitgtk gobject-introspection pkg-config glib-networking cacert mesa xorg.xvfb \
  --run 'bash -c "
    export GDK_BACKEND=x11
    export GIO_EXTRA_MODULES=$(nix eval --raw nixpkgs#glib-networking)/lib/gio/modules
    export SSL_CERT_FILE=$(nix eval --raw nixpkgs#cacert)/etc/ssl/certs/ca-bundle.crt
    echo GIO_EXTRA_MODULES=$GIO_EXTRA_MODULES
    echo SSL_CERT_FILE=$SSL_CERT_FILE
    exec bash
  "'
