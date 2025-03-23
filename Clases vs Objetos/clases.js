
// clases y objetos

console.log("\n")

class apartamento {

    constructor(ventanas, block, ceramica, bombillos,color_base, color_final){
        this.ventanas = ventanas;
        this.block = block;
        this.ceramica = ceramica;
        this.bombillos = bombillos;
        this.color_base = color_base;
        this.color_final = color_final;
    }


}

let casa = new apartamento (22,"3,500","2,000",12,"Blanco.","Rosado.");

console.log(casa.color_final);


console.log("\n")

class Universidades {

    constructor (Intec,Itla,UASD,Unicaribe, UNIBE) {

        this.Intec = Intec;
        this.Itla = Itla;
        this.UASD = UASD;
        this.Unicaribe = Unicaribe;
        this.UNIBE = UNIBE;

    }

}

let carreras = new Universidades ("Abogado.", "Desarrollador De Software", "Idiomas.", "Ingeniero Civil.", "Educacion.");

console.log("Angel estudia",carreras.Itla, "en el ITLA.");

console.log("\n")



class cachorros {

    constructor (nombre,raza,edad,sexo,color) {

        this.nombre = nombre;
        this.raza = raza;
        this.edad = edad;
        this.sexo = sexo;
        this.color = color;

    }

}



let perro = new cachorros ("Toby","Pitbull", "5 años,", "Macho", "Blanco.");
console.log(perro.nombre, "es un", perro.raza, "de", perro.edad, "es", perro.sexo, "y es de color", perro.color);

console.log("\n")

let perra = new cachorros ("Miriam","Pitbull", "2 años,", "Hembra", "Negra.");
console.log(perra.nombre, "es una", perra.raza, "de", perra.edad, "es", perra.sexo, "y es de color", perra.color);

console.log("\n")

console.log("\n")

class carros {
    constructor (modelo, año, color, documentos, costo){

    this.modelo = modelo;
    this.año = año;
    this.color = color;
    this .documento = documentos;
    this.costo = costo;

    }



}

/* Este es un objeto instanciado de la clase carross */
const vehiculo = new carros ("Toyota", "2021", "Negro", "Al dia", "RD$ 1,500,000.00");

console.log(`Yo necesito comprar un carro ${vehiculo.modelo} del año ${vehiculo.año}, pero me gustaria de color ${vehiculo.color} y que los documentos esten ${vehiculo.documento}, que cueste por lo menos ${vehiculo.costo}.`)

console.log("\n")