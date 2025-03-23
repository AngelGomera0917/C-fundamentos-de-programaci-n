import pandas as pd # type: ignore

# Crear un DataFrame a partir de un diccionario
data = {
    'Nombre': ['Ana', 'Luis', 'Carlos', 'Marta'],
    'Edad': [23, 45, 34, 29],
    'Ciudad': ['Madrid', 'Barcelona', 'Sevilla', 'Valencia']
}

df = pd.DataFrame(data)  # Crear el DataFrame
print("DataFrame inicial:")
print(df)

# Filtrar personas mayores de 30 años
mayores_30 = df[df['Edad'] > 30]
print("\nPersonas mayores de 30 años:")
print(mayores_30)

# Agregar una nueva columna
df['Salario'] = [3000, 4000, 3500, 3200]
print("\nDataFrame con nueva columna 'Salario':")
print(df)

# Promedio de edad
promedio_edad = df['Edad'].mean()
print(f"\nEl promedio de edad es: {promedio_edad:.2f}")

# Guardar el DataFrame en un archivo CSV
df.to_csv('datos.csv', index=False)
print("\nDatos guardados en el archivo 'datos.csv'.")

print("\n")




# Este es un calendario para Darli

import calendar # La libreria calendario
yy = 2024
mm = 12
print(calendar.month(yy,mm))

print("\n")






import calendar

# Función para mostrar el calendario de un mes específico
def mostrar_calendario(yy, mm):
    print(calendar.month(yy, mm))  # Muestra el calendario en formato de texto

# Llamada a la función
mostrar_calendario(2025, 1)


print("\n")


# Configuración inicial
while True:
    print("\n=== Calendario ===")
    try:
        yy = int(input(" Introduce el año (por ejemplo, 2024): "))
        mm = int(input("\n Introduce el mes (1-12): "))
        
        if 1 <= mm <= 12:
            mostrar_calendario(yy, mm)
        else:
            print("El mes debe estar entre 1 y 12.")
        
        # ¿Continuar o salir?
        continuar = input("¿Quieres ver otro mes? (s/n): ").lower()
        if continuar != 's':
            print("¡Adiós!")
            break
    except ValueError:
        print("Por favor, introduce números válidos.")
        
        
        
print("\n")

import calendar

# Crear un calendario HTML para un año específico

def generar_calendario_html(yy):
    html_calendar = calendar.HTMLCalendar()
    calendario_html = html_calendar.formatyear(yy, width=3)  # Generar HTML para el año completo
    with open(f"calendario_{yy}.html", "w", encoding="utf-8") as file:
        file.write(calendario_html)
    print(f"El calendario para el año {yy} ha sido generado como 'calendario_{yy}.html'.")

# Solicitar el año

year = int(input("Introduce el año para generar el calendario HTML: "))
generar_calendario_html(year)

