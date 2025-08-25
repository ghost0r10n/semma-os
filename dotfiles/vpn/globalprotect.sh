#!/usr/bin/env nix-shell
#!nix-shell -i bash -p python3 python3.pkgs.pip openconnect cairo pkg-config gtk3 gobject-introspection

set -e

# ==============================================================================
# All-in-One GlobalProtect VPN Connector for NixOS
# ==============================================================================
export PATH="$HOME/.local/bin:$PATH"
export GI_TYPELIB_PATH="${GI_TYPELIB_PATH:+$GI_TYPELIB_PATH:}$(pkg-config --variable=typelibdir gtk+-3.0)"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$(pkg-config --variable=libdir gtk+-3.0)"

eval $(gp-saml-gui --gateway "$GATEWAY")
echo "COOKIE: $COOKIE"
echo "HOST: $HOST"
if [ -n "$HOST" ]; then
  echo $COOKIE | sudo openconnect --protocol=gp -u "$USER" --passwd-on-stdin "$HOST"
else
  echo "Error: HOST variable not set. gp-saml-gui may have failed."
fi

ENV_FILE=".env"
DEFAULT_GATEWAY="core.altermaind.com"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}--- GlobalProtect VPN Connector (NixOS) ---${NC}"

if [ -f "$ENV_FILE" ]; then
  source "$ENV_FILE"
  echo "Configuration loaded from $ENV_FILE."
else
  echo -e "${YELLOW}Configuration file ($ENV_FILE) not found. Starting interactive setup...${NC}"
fi

if [ -z "$GATEWAY" ]; then
  echo "Please provide your VPN gateway."
  read -p "Enter VPN Gateway [default: $DEFAULT_GATEWAY]: " user_gateway
  GATEWAY=${user_gateway:-$DEFAULT_GATEWAY}
  echo "Saving configuration to $ENV_FILE..."
  echo -e "${GREEN}Configuration saved.${NC}"
fi

# --- Step 2: Check for and Install gp-saml-gui ---
if ! command -v gp-saml-gui &>/dev/null; then
  echo -e "${YELLOW}gp-saml-gui not found. Installing locally with pip...${NC}"
  pip install --user pycairo --break-system-packages
  pip install --user https://github.com/dlenski/gp-saml-gui/archive/master.zip --break-system-packages
  export PATH="$HOME/.local/bin:$PATH"
  echo -e "${GREEN}gp-saml-gui installed.${NC}"
fi

echo -e "${BLUE}--- Ready to Connect ---${NC}"
echo "Gateway:  $GATEWAY"
sudo -v
eval $(gp-saml-gui --gateway "$GATEWAY")
echo $COOKIE | sudo openconnect --protocol=gp -u "$USER" --passwd-on-stdin "$HOST"

echo -e "${GREEN}--- VPN process finished ---${NC}"
