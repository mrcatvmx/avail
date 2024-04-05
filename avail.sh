#!/bin/bash

# Intro
echo "========================================================================="
echo "  _____   _____   _____    _    _   ______   _____                 "
echo " / ____| |_   _| |  __ \  | |  | | |  ____| |  __ \               "
echo "| |        | |   | |__) | | |__| | | |__    | |__) |             "
echo "| |        | |   |  ___/  |  __  | |  __|   |  _  /             "
echo "| |____   _| |_  | |      | |  | | | |____  | | \ \              "
echo " \_____| |_____| |_|      |_|  |_| |______| |_|  \_\           "
echo "========================================================================="
echo

# Social media links
echo "Follow us on social media:"
echo "Twitter: https://twitter.com/cipher_airdrop"
echo "Telegram: https://t.me/+tFmYJSANTD81MzE1"
echo

# Main code section
sudo tee /etc/systemd/system/avail.service > /dev/null <<EOF
[Unit]
Description=Avail Light Client
After=network.target
StartLimitIntervalSec=0

[Service]
User=$USER
Restart=always
RestartSec=5
ExecStart=$HOME/.avail/bin/avail-light --network goldberg --config $HOME/.avail/config/config.yml --app-id 0 --identity $HOME/.avail/identity/identity.toml
LimitNOFILE=65000

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable avail
sudo systemctl start avail

read -p "Do you want to check logs (y/n)? " choice
if [ "$choice" = "y" ]; then
    sudo journalctl -fu avail -o cat
fi
