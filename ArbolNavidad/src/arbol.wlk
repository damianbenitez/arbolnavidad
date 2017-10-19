class Arbol {
  var lugares
  var vejez
  var tamanioTronco
  var items
  constructor(_lugares,_vejez, _tamanioTronco){
  	lugares = _lugares
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
  method capacidadUsada() = items.fold(0, {acum, item =>  acum + item.lugares()} )
  method capacidadDisponible() = self.lugares() - self.capacidadUsada()
  method sumaTodasImportancias() = items.fold(0, {acum, item =>  acum + item.importancia()} )
  method importancia() = self.sumaTodasImportancias()
  method promedioImportancia() = self.sumaTodasImportancias() / self.items().size()
  method itemsImportantes() = items.filter({item => item.importancia() > self.promedioImportancia()})
  method itemsVoluminosos() = items.filter({item => item.lugares() > 5 })
    
}

class Regalo {
 var destinatarios = []
 
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
}

class Tarjeta{
 var destinatario
 var importancia
 
 method destinatario(_destinatario){
  destinatario = _destinatario
 }
 
 method destinatario() = destinatario
 
 method importancia(_importancia) {
  importancia = _importancia
 }
 
 method importancia() = importancia
 
 method lugares(){
  return 0
 }

}

class Adorno {
 var peso
 var coeficienteSuperioriodad
 
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
 
 method destinatarios(){
  return []
 }
 
}

class Figura {
	var adornos = []
	method adornos() = adornos
	method adornos(_adornos){
		adornos = _adornos
	}
	method lugares() = 1 + adornos.fold(0, {acum, adorno =>  acum + adorno.lugares()} )
	method adornosOrdenadosPorImportancia() = 
		adornos.sortedBy({adorno1, adorno2 => adorno1.importancia() < adorno2.importancia()})
	method adornoMasImportante() = self.adornosOrdenadosPorImportancia().first() 
	method importancia() = self.adornoMasImportante()	 
}

class Estrella{
	method lugares() = 1	 
	method importancia() = 10
}