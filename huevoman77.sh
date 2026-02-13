#!/bin/bash
# ==============================================================
#   HUEVOMAN77 ULTIMATE v7.0 - GOD MODE EDITION
#   Creador: Huevoman77 | El Manager Definitivo
#   Híbrido: VPS (Ubuntu/Debian) & TERMUX
# ==============================================================

# --- DETECCIÓN DE ENTORNO ---
if [[ -d /data/data/com.termux ]]; then
    ENTORNO="Termux"; BIN_DIR="$PREFIX/bin"; PKG_MGR="pkg"; CONF_DIR="$HOME/.huevoman77"
else
    ENTORNO="VPS"; BIN_DIR="/usr/bin"; PKG_MGR="apt-get"; CONF_DIR="/etc/huevoman77"
    [[ "$(id -u)" != "0" ]] && echo "¡Error! Corre con sudo." && exit 1
fi
mkdir -p "$CONF_DIR"
TOKEN_FILE="$CONF_DIR/token.txt"
CHAT_ID_FILE="$CONF_DIR/chatid.txt"

# --- COLORES ---
CYAN='\e[1;36m'; PINK='\e[1;35m'; GREEN='\e[1;32m'; YELLOW='\e[1;33m'; RED='\e[1;31m'; NC='\e[0m'; WHITE='\e[1;37m'

# --- FUNCIÓN TELEGRAM ---
function enviar_telegram() {
    if [[ -f "$TOKEN_FILE" && -f "$CHAT_ID_FILE" ]]; then
        TOKEN=$(cat "$TOKEN_FILE")
        ID=$(cat "$CHAT_ID_FILE")
        MENSAJE=$1
        curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" -d "chat_id=$ID" -d "text=$MENSAJE" > /dev/null
    fi
}

# --- DISEÑO DEL BANNER ---
function banner() {
    clear
    ram_total=$(free -m | awk '/Mem:/ {print $2}')
    ram_used=$(free -m | awk '/Mem:/ {print $3}')
    cpu_load=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    
    echo -e "${CYAN}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${PINK}   _  _ _  _ ____ _  _ ____ _  _ ____ _  _    ▀▀▀█▀▀▀▀▀   ${CYAN}║${NC}"
    echo -e "${CYAN}║${PINK}   |__| |  | |___ |  | |  | |\/| |__| |\ |      █  █  █   ${CYAN}║${NC}"
    echo -e "${CYAN}║${PINK}   |  | |__| |___  \/  |__| |  | |  | | \|      █  █  █   ${CYAN}║${NC}"
    echo -e "${CYAN}╠═══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${WHITE}     CREADOR: HUEVOMAN77 | v7.0 GOD MODE | MODO: $ENTORNO    ${CYAN}║${NC}"
    echo -e "${CYAN}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo -e "${GREEN} 🛰️  IP:${NC} $(curl -s --connect-timeout 2 ifconfig.me || echo "Local") | ${GREEN}🧠 RAM:${NC} $ram_used/${ram_total}MB | ${GREEN}🔥 CPU:${NC} $cpu_load%"
    echo -e "${CYAN}─────────────────────────────────────────────────────────────────${NC}"
}

# --- CONFIGURAR BOT ---
function config_bot() {
    banner
    echo -e "${YELLOW}--- CONFIGURACIÓN TELEGRAM BOT ---${NC}"
    read -p "Ingresa tu Bot Token: " btok
    read -p "Ingresa tu Chat ID: " bcid
    echo "$btok" > "$TOKEN_FILE"
    echo "$bcid" > "$CHAT_ID_FILE"
    enviar_telegram "✅ ¡Bot de Huevoman77 vinculado correctamente al servidor!"
    echo -e "${GREEN}¡Configurado! Revisa tu Telegram.${NC}"
    sleep 2
}

# --- FUNCIONES ORIGINALES PROXYSOCKS ---
function listar_usuarios() {
    banner
    echo -e "${PINK}--- USUARIOS REGISTRADOS ---${NC}"
    if [[ "$ENTORNO" == "VPS" ]]; then
        cut -d: -f1 /etc/passwd | grep -vE '(root|daemon|bin|sys|sync|games|man|lp|mail|news|uucp|proxy|www-data|backup|list|irc|gnats|nobody|systemd|messagebus|sshd)'
    else
        echo "En Termux no hay gestión de multi-usuarios del sistema."
    fi
    read -p "Enter..."
}

# --- MENÚ PRINCIPAL ---
function menu() {
    enviar_telegram "🚀 El script Huevoman77 ha sido iniciado en la IP: $(curl -s ifconfig.me)"
    while true; do
        banner
        echo -e "${PINK}[1]${NC} Crear Usuario SSH             ${PINK}[8]${NC} Instalar WireGuard"
        echo -e "${PINK}[2]${NC} Eliminar Usuario SSH          ${PINK}[9]${NC} Instalar V2Ray / Xray"
        echo -e "${PINK}[3]${NC} Listar Usuarios               ${PINK}[10]${NC} Activar BadVPN (UDP 7300)"
        echo -e "${CYAN}-----------------------------------------------------------------${NC}"
        echo -e "${YELLOW}[4]${NC} Optimizar VPS (BBR+ZRAM)      ${YELLOW}[11]${NC} Configurar Telegram Bot ${GREEN}(NUEVO)${NC}"
        echo -e "${YELLOW}[5]${NC} Limpieza de Logs/Caché        ${YELLOW}[12]${NC} Modo Invisible (Cloudflare)"
        echo -e "${YELLOW}[6]${NC} Test de Velocidad             ${YELLOW}[13]${NC} Anti-Torrent / Firewall"
        echo -e "${YELLOW}[7]${NC} Optimizar DNS/Ping            ${YELLOW}[14]${NC} Escaner de Puertos"
        echo -e "${CYAN}-----------------------------------------------------------------${NC}"
        echo -e "${RED}[15] INSTALAR DEPENDENCIAS        [0] SALIR${NC}"
        echo -ne "\n${CYAN}Huevoman77-GOD-Selection: ${NC}"
        read opt

        case $opt in
            1) # Crear
               read -p "Nombre: " us; read -p "Clave: " ps; useradd -M -s /bin/false $us; echo "$us:$ps" | chpasswd
               enviar_telegram "👤 Usuario Creado: $us"; sleep 1 ;;
            2) read -p "Usuario a borrar: " usb; userdel --force $usb; enviar_telegram "🗑️ Usuario Eliminado: $usb"; sleep 1 ;;
            3) listar_usuarios ;;
            4) # BBR + ZRAM logic
               if [[ "$ENTORNO" == "VPS" ]]; then apt install zram-config -y; sysctl -w net.ipv4.tcp_congestion_control=bbr; fi
               echo "Optimizado."; sleep 1 ;;
            5) rm -rf /var/log/*.gz; apt-get clean; echo "Limpio."; sleep 1 ;;
            6) banner; pip install speedtest-cli; speedtest-cli --simple; read -p "Enter..." ;;
            7) echo "nameserver 1.1.1.1" > /etc/resolv.conf; sleep 1 ;;
            8) wget https://git.io/wireguard-install -O wg.sh && bash wg.sh ;;
            9) bash <(curl -L https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh) ;;
            10) screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 ;;
            11) config_bot ;;
            12) banner; echo "Iniciando túnel Cloudflare..."; sleep 2 ;;
            13) iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP; echo "Firewall ON"; sleep 1 ;;
            14) banner; netstat -tulpn; read -p "Enter..." ;;
            15) $PKG_MGR update -y && $PKG_MGR install curl wget git python screen net-tools -y ;;
            0) exit 0 ;;
            *) echo "Inválido"; sleep 1 ;;
        esac
    done
}

menu
