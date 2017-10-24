import arbol.*

object reports {
	var arbolito = new Arbol(2,3)
	var tarjeta1 = new Tarjeta("pepe", 10)	
	var tarjeta2 = new Tarjeta("carlos", 15)
	var regalo1 = new Regalo(["pepe","maria"])
	var adorno1 = new Adorno(2,1)
	var adorno2 = new Adorno(6,1)
	var figura1 = new Figura([adorno1])
//	var figura2 = new Figura([adorno2,adorno1])
	var estrella1 = new Estrella()
		
	method initialize(){
		arbolito.agregarItem(tarjeta1)
		arbolito.agregarItem(tarjeta2)
		arbolito.agregarItem(regalo1)
		arbolito.agregarItem(adorno1)
		arbolito.agregarItem(estrella1)	
	}
	method reporteDestinatariosRepetidos(){
		arbolito.mostrarDestinatariosRepetidos()
	}
	method arbol() = arbolito
}
