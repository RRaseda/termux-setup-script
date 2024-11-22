#!/bin/bash

echo "Starting setup..."

# Update dan install android-tools
pkg update -y && pkg upgrade -y
pkg install -y android-tools

echo "Android tools installed successfully."

# Tambahkan konfigurasi ke ~/.termux/termux.properties
TERMUX_PROPERTIES_FILE="$~/.termux/termux.properties"

echo "Configuring termux.properties..."
# Backup existing file jika ada
if [[ -f "$TERMUX_PROPERTIES_FILE" ]]; then
    cp "$TERMUX_PROPERTIES_FILE" "$TERMUX_PROPERTIES_FILE.bak"
    echo "Backup created: termux.properties.bak"
fi

# Tambahkan pengaturan ke termux.properties
cat <<EOL > "$TERMUX_PROPERTIES_FILE"
# Custom keyboard shortcuts
extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
EOL

# Reload Termux settings
termux-reload-settings

echo "Termux configuration updated."

# Notifikasi selesai
echo "Setup completed successfully! You can now use the android-tools."
