#!/bin/bash
# Install Headscale for GitHub Codespaces
wget https://github.com/juanfont/headscale/releases/download/v0.22.3/headscale_0.22.3_linux_amd64.deb
sudo dpkg -i headscale_0.22.3_linux_amd64.deb
sudo mkdir -p /var/lib/headscale
sudo touch /var/lib/headscale/db.sqlite
cat << 'EOF' | sudo tee /etc/headscale/config.yaml
server_url: http://0.0.0.0:8080
listen_addr: 0.0.0.0:8080
database:
  type: sqlite3
  sqlite:
    path: /var/lib/headscale/db.sqlite
EOF
echo "Setup Complete! Run: sudo headscale serve"
