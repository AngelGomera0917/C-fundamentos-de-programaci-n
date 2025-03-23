
print("\n")


def verificar (numero):
    if numero < 0:
        
        return  # Sale de la función sin hacer nada
    
    else:
        print("Número positivo:", numero)
    
verificar(5)  # No imprimirá nada


print("\n")

def suma(a, b):
    
    return a + b  # Devuelve la suma

resultado = suma(3, 4)

print(resultado)  # 7

print("\n")

def recomendacion_planta(cuidado):
    
    if cuidado == "bajo":
        print ("Cactus")
    
    elif cuidado == "medio":
        print ("Suculenta")
    
    elif cuidado == "alto":
        print ("Orquídea")
    
    else:
        return "No se encontró ninguna planta"
    
recomendacion_planta("medio")  # Suculenta

print("\n")


