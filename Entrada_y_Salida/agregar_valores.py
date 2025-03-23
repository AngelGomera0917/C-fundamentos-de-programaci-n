archivo = open("valores.txt", "rt")  # Corrección del nombre de la variable
archivoS = open("valores_Totales.txt", "wt")

print("Procesando Entrada...")

suma = 0
for linea in archivo:  # Usamos 'archivo' en lugar de 'archivoN'
    suma += int(linea)
    print(linea.rstrip(), file=archivoS)

print("\nTotal:", str(suma), file=archivoS)

archivo.close()  # Cerramos el archivo de entrada
archivoS.close()

print("Proceso Terminado...")

import os

ruta = "valores.txt"

if not os.path.exists(ruta):
    print(f"Error: No se encontró el archivo '{ruta}'.")
    exit()

with open(ruta, "rt") as archivo:
    print("Archivo abierto correctamente.")

