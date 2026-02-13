cat <<EOF > README.md
# ⚡ HUEVOMAN77 ULTIMATE MANAGER v7.0 ⚡
> **"La navaja suiza definitiva para la gestión de redes, seguridad y optimización de servidores."**

![Copyright](https://img.shields.io/badge/Copyright-%C2%A9%202026%20Huevoman77-blue)
![Version](https://img.shields.io/badge/Version-7.0%20GOD%20MODE-pink)
![License](https://img.shields.io/badge/License-Creative%20Commons-green)

---

## 📖 Introducción Profesional
**Huevoman77 Ultimate** es un entorno de ejecución automatizado que permite administrar servidores VPS y dispositivos Android (Termux) con un enfoque en la **velocidad de red** y la **seguridad de túneles**. Diseñado para optimizar la experiencia de usuario en navegación privada y juegos en línea.

---

## 🛠️ Diccionario de Herramientas y Manual de Uso

### 1. 🛡️ Gestión de Túneles y VPN
* **WireGuard:**
    * **¿Para qué sirve?** Es el protocolo VPN más moderno. Sustituye a OpenVPN siendo más rápido y ligero.
    * **Modo de uso:** Selecciona la opción en el menú, genera las llaves del cliente y descarga el archivo `.conf` para usarlo en la app de WireGuard.
* **V2Ray / Xray:**
    * **¿Para qué sirve?** El estándar de oro para evadir bloqueos de operadoras (DPI). Permite camuflar el tráfico como navegación web normal.
    * **Modo de uso:** Activa el protocolo, elige el puerto (443 recomendado) y copia el enlace `vmess://` o `vless://` en tu app inyectora.
* **BadVPN (UDP Gateway):**
    * **¿Para qué sirve?** Activa el tráfico UDP necesario para que los juegos (Free Fire, PUBG) no den error de conexión.
    * **Modo de uso:** Ejecútalo y elige el puerto **7300**. El script lo dejará corriendo en segundo plano automáticamente.

### 2. ⚡ Optimización de Sistema (Performance)
* **Google BBR (Bottleneck Bandwidth and RTT):**
    * **¿Para qué sirve?** Acelera la velocidad de descarga al reducir la congestión del tráfico TCP en el Kernel de Linux.
    * **Modo de uso:** Selecciona "Optimizar Red". El script modificará el archivo \`/etc/sysctl.conf\` y activará BBR de forma permanente.
* **ZRAM Memory Control:**
    * **¿Para qué sirve?** Crea una partición de RAM comprimida. Si tu VPS tiene 1GB, ZRAM lo hace rendir como si tuviera 2GB.
    * **Modo de uso:** Actívalo desde el menú de optimización para mejorar la estabilidad si tienes muchos usuarios conectados.

### 3. 🛡️ Seguridad y Auditoría
* **Firewall Anti-Torrent:**
    * **¿Para qué sirve?** Bloquea los puertos y protocolos usados para descargar Torrents, protegiendo tu VPS de baneos por derechos de autor.
    * **Modo de uso:** Solo actívalo una vez. El script configurará reglas de IPTABLES para denegar el tráfico P2P.
* **Scaner de Puertos:**
    * **¿Para qué sirve?** Revisa qué "puertas" están abiertas en tu servidor para evitar hackeos.
    * **Modo de uso:** Ingresa la IP que quieres revisar y espera el reporte de puertos abiertos.

---

## 📥 Guía de Instalación Detallada

### 🛠️ Método 1: Instalación Automática (Recomendado)
Ideal para usuarios que buscan rapidez sin complicaciones.
\`\`\`bash
curl -Lso huevoman.sh https://raw.githubusercontent.com/huevoman77/Huevoman77-Ultimate/main/huevoman77.sh && chmod +x huevoman.sh && ./huevoman.sh
\`\`\`

### 🏗️ Método 2: Instalación Manual (Paso a Paso)
Para desarrolladores que desean auditar el proceso:
1.  **Actualizar paquetes:** \`pkg update && pkg upgrade -y\`
2.  **Instalar dependencias:** \`pkg install git curl -y\`
3.  **Clonar el repositorio:** \`git clone https://github.com/huevoman77/Huevoman77-Ultimate.git\`
4.  **Acceder y dar permisos:** \`cd Huevoman77-Ultimate && chmod +x huevoman77.sh\`
5.  **Ejecutar:** \`./huevoman77.sh\`

---

## 👨‍💻 Créditos y Comunidad
Este proyecto es desarrollado y mantenido por **Huevoman77**.

* 📡 **Telegram Oficial:** [@huevoman77](https://t.me/huevoman77)
* 👤 **Facebook:** [Perfil de Desarrollador](https://www.facebook.com/profile.php?id=100092597257349)
* 🤝 **Contribuciones:** Si deseas mejorar el código, abre un "Pull Request" o contáctame por Telegram.

---

## ©️ Copyright y Términos de Uso
**Copyright ©️ 2026 Huevoman77.**
* Se permite el uso personal y educativo.
* Prohibido vender este script sin autorización previa.
* El autor no se responsabiliza por el mal uso de las herramientas de red aquí presentadas.

EOF
