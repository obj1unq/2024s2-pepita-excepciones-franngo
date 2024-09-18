object pepita { //prueba
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		energia = energia - 10 - distancia
	}
		
	method energia() {
		return energia
	}

	method puedeVolar(distancia) {
		return energia >= (10 + distancia) //(si su energía actual es suficiente para volar "distancia" kilómetros)
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
		energia += energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
		energia = energia - 20 - 2*distancia
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
		aves.remove(ave)
	}

	method movilizar(distancia) {
		if (self.todasPuedenVolar(distancia)) {
			aves.forEach({ave => ave.volar(distancia)})
		} else {
			self.error("La totalidad de aves de Milena no es capaz de volar " + distancia + " kilómetros")
		}
	}

	method todasPuedenVolar(distancia) {
		return aves.all({ave => ave.puedeVolar(distancia)})
	}

}

