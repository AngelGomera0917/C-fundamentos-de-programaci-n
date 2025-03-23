let z; // Se declara una variable global pero sin inicializar 	
function notPure(){
	z = z+10; // Se intenta sumar 10 a una variable no inicializada
}
notPure(); // Llamamos a la función

console.log(z); // ¿Qué sucede aquí?

console.log("\n")

function sumTen(d) {
    return d + 10;
}

let d = 0;
z = sumTen(d); // Ahora d es 10
console.log(d); // 10
