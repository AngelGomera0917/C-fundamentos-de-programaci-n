
print("\n")

carros = [
    "Audi",
    "BMW",
    "Ford",
    "Mazda",
    "Toyota",
    "Nissan"
]

for carro in carros: # Por cada carro en la lista de carros(Significado)
    print(carro) # Imprimir carro
    
print("\nAmo estos Vehiculos. ")

print("\n")

frutas = [ "Manzana", "Pera", "Uva", "Fresa", "Mango", "Papaya" ]

print(" nuestra seleccion de frutas: \n")
for i, fruta in enumerate(frutas, 1): # utilizar la funcion enumerate para obtener el indice y el valor de la lista
    print(i,". ", fruta, "\n",sep = "") # con el parametro sep = "" quito el espacio que me genera automatico entre el indice y el valor de la lista
    #print (f"{i}. {fruta}\n") # Otra forma de hacerlo, utilizando f-string sin el parametro sep = ""

print("\n") # Salto de linea

