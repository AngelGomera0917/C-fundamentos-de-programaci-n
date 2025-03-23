let ma = ["mari", "Dayi"];
ma.push("Mariela");       // Agregar al final
ma.splice(1, 0, "Delmi"); // Insertar en la posición 1

// Opción 1: Usando forEach para imprimir cada elemento con su índice
ma.forEach((nombre, i) => {
    console.log(`${i + 1}. ${nombre}`);
});

// Opción 2: Usando map() y join() para una salida en una sola línea
console.log(ma.map((nombre, i) => `${i + 1}. ${nombre}`).join(" . "));


