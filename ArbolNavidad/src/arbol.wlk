class Arbol {
  var vejez
  var tamanioTronco
  var items = []
  
  constructor(_vejez, _tamanioTronco){
  	vejez = _vejez
  	tamanioTronco = _tamanioTronco
  }
  method lugares() = self.vejez() * self.tamanioTronco()
  method vejez() = vejez
  method vejez(_vejez) {
  	vejez = _vejez
  }
  method tamanioTronco() = tamanioTronco
  method tamanioTronco(_tamanioTronco){
  	tamanioTronco = _tamanioTronco
  }
  method items() = items
  method agregarItem(_item) {
  	if (_item.lugares() <= self.capacidadDisponible()){
		items.add(_item)
	}else{
		throw new Exception("No se pudo agregar el item")  		
  	}
  	
  }
  method capacidadUsada() = items.sum({item => item.lugares()})
  method capacidadDisponible() = self.lugares() - self.capacidadUsada()
  method sumaTodasImportancias() = items.sum({item => item.importancia()})
  method importancia() = self.sumaTodasImportancias()
  method promedioImportancia() = self.sumaTodasImportancias() / self.items().size()
  method itemsImportantes() = items.filter({item => item.importancia() > self.promedioImportancia()})
  method itemsVoluminosos() = items.filter({item => item.lugares() > 5 })
  method borrarVoluminosos(){
  	self.itemsVoluminosos().forEach({itemVol => items.remove(itemVol) })
  }
  method todosDestinatarios(){
  	var todosDestinatarios = []  	
  	items.forEach({item => 
  		todosDestinatarios.addAll(item.destinatarios())
  	})
  	return todosDestinatarios
  }
  method destinatariosItems() =  	  	  	
	self.todosDestinatarios().asSet().fold(new Dictionary(), 
		{dic, destinatario => 
		var repeticiones = self.todosDestinatarios()
			.count({unDestinatario => unDestinatario == destinatario})
		dic.put(destinatario, repeticiones)  		
	})
  	
  
  method mostrarDestinatariosRepetidos(){
  	self.destinatariosItems().sortBy({dest,cant => cant})
  		.forEach({dest,cant => console.println(dest +" "+cant)})
  }
    
}

class Regalo {
 var destinatarios = []
 constructor(_destinatarios){
 	destinatarios = _destinatarios
 }
 
 method destinatarios(_destinatarios){
  destinatarios = _destinatarios
 }
 
 method destinatarios() = destinatarios
 
 method importancia(){
  return 2 * self.cantidadDestinatarios()
 }
 method cantidadDestinatarios(){
  return destinatarios.size()
 }
 method lugares(){
  return 1
 }
 method agregarDestinatario(_persona){
 	destinatarios.add(_persona)
 }
}

class Tarjeta{
 var destinatario
 var importancia
 
 constructor(_destinatario,_importancia){
 	destinatario = _destinatario
 	importancia = _importancia
 }
 
 method destinatario(_destinatario){
  destinatario = _destinatario
 }
 
 method destinatario() = destinatario
 method destinatarios() = [destinatario]
 
 method importancia(_importancia) {
  importancia = _importancia
 }
 
 method importancia() = importancia
 
 method lugares(){
  return 0
 }
 
  method agregarDestinatario(_persona){
 	destinatario = _persona
 }

}

class Adorno {
 var peso
 var coeficienteSuperioriodad
 
 constructor(_peso, _coeficienteSuperioriodad){
 	peso = _peso
 	coeficienteSuperioriodad = _coeficienteSuperioriodad
 }
 
 method peso(_peso){
  peso = _peso
 }
 
 method peso() = peso
 
 method coeficienteSuperioriodad(_coeficienteSuperioriodad){
  coeficienteSuperioriodad = _coeficienteSuperioriodad
 }
 method coeficienteSuperioriodad() = coeficienteSuperioriodad
 
 method importancia(){
  return self.peso() * self.coeficienteSuperioriodad()
 }
 
 method lugares(){
  var p = self.peso()
  if (p > 3) {
   return 3
  }else{
   return p
  }  
 }
 
 method destinatarios() = []
 
 method agregarDestinatario(_persona){	
 }
 
}

class Figura {
	var adornos = []
	constructor(_adornos){
		adornos = _adornos 
	}
	method adornos() = adornos
	method adornos(_adornos){
		adornos = _adornos
	}
	method lugares() = 1 + adornos.sum({adorno => adorno.lugares()})		
	method adornoMasImportante() = adornos.max({adorno => adorno.importancia()}) 
	method importancia() = self.adornoMasImportante()
	method agregarDestinatario(_persona){
 	}
 	method destinatarios() = []
}

class Estrella{	
	method lugares() = 1	 
	method importancia() = 10
	method agregarDestinatario(_persona){
 		casa.agregarHabitante(_persona)
 	}
 	method destinatarios() = casa.habitantes()
 }
 
 object casa{
 	var habitantes = ["pepe","carlos","maria","juan"]
 	method habitantes() = habitantes
 	method agregarHabitante(_habitante){
 		habitantes.add(_habitante)
 	} 	
 }