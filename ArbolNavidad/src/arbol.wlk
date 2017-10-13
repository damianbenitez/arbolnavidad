class Arbol {
  var lugares
  var vejez
  var tamanioTronco
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
	method importancia() = adornos.fold(0, {acum, adorno =>  acum + adorno.imporancia()} )
}