object pepita { //prueba
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}

	method energia() {
		return energia
	}

	//en vez de ejecutar código si se cumple x y sino tirar error, se hace validación (preguntar si NO se cumple x y, en ese caso,
	//tirar error) y después se ejecuta el código
	method volar(distancia) {
		self.validarPuedeVolar(distancia)
		energia = energia - 10 - distancia
	}

	method puedeVolar(distancia) {
		return energia >= (10 + distancia) //(si su energía actual es suficiente para volar "distancia" kilómetros)
	}

	method validarPuedeVolar(distancia) {
		if(!self.puedeVolar(distancia)) {
			self.error("pepita no puede volar " + distancia + " kilómetros")
		}
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia = energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
		self.validarPuedeVolar(distancia)
		energia = energia - 20 - 2*distancia
	}

	method validarPuedeVolar(distancia) {
		if(!self.puedeVolar(distancia)) {
			self.error("pepon no puede volar " + distancia + " kilómetros")
		}
	}

	method puedeVolar(distancia) {
		return energia >= (20 + distancia * 2) //(si su energía actual es suficiente para volar "distancia" kilómetros)
	}
	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

object milena {
	const aves = #{}

	method agregarAve(ave) {
		aves.add(ave)
	}

	method sacarAve(ave) {
		aves.remove(ave) //acá también podrías agregar un validar antes del remove, ya que si hacés remove si no está el ave daría error
	}

	method movilizar(distancia) {
		self.validarMovilizar(distancia) //si no se puede, tira excepción. Si sí se puede, sigue ejecutando.
		self.hacerVolarATodas(distancia)
	}

	method validarMovilizar(distancia) { //la validación es = si no se da algo/se da x cosa que no queremos, entonces ERROR
		if (!self.todasPuedenVolar(distancia)) {
			self.error("La totalidad de aves de Milena no es capaz de volar " + distancia + " kilómetros")
		}
	}

	method hacerVolarATodas(distancia) { 
		aves.forEach({ave => ave.volar(distancia)})
	}

	method todasPuedenVolar(distancia) { //lo que se va a usar en el if de la condición de la validación
		return aves.all({ave => ave.puedeVolar(distancia)})
	}

}

//código estructurado en 3 etapas
//1.prepracion de las referencias
//2.las acciones que se realizan (que el código trabaje)
//3.validar que el estado de esos objetos tengan el estado que uno espera (tests)
