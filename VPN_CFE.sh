#!/bin/bash
#
#
echo "====================================="
echo "           CONECTAR A CFE            "
echo "====================================="
echo "1) Iniciar tuneles."
echo "2) Terminar tuneles."
echo "3) Ver estado del vpn."
echo "4) Salir."
echo "====================================="
read -p "Selecciona una opción [1-4]" opcion

case $opcion in
	1)
		echo "[+] Iniciando sesión principal."
		ipsec up FC_Linux
		echo "[+] Acoplando subred 172"
		ipsec up FC_Red172
		echo "[+]Proceso completado."
		;;
	2)
		echo "[-]Cerrando todas las conexiones."
		ipsec down FC_Linux
		ipsec down FC_Red172
		echo "[-]Desconexión completa."
		;;
	3)
		echo "[*]Mostrando estado actual del tunel."
		ipsec statusall
		;;
	4)
		echo "Saliendo."
		exit 0
		;;
	*)
		echo "[-]Opción no válida."
		exit 1
		;;
esac
