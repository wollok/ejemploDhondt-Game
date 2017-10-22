/** First Wollok example */
class Dont {
	var cocientes = []
	var resultados = []
	var ganadores 
	var cargos
	constructor(c){cargos = c}
	
	method agregarResultado(partido,cantidad) {
		resultados.add(new Resultado(partido,cantidad))
	}
	method calcular() {
		cargos.times{i=>
			cocientes.addAll(resultados.map{r=>r.dividir(i)})
		}
		cocientes.sortBy{a,b=>a.cantidad()>b.cantidad()}
		ganadores = cocientes.take(cargos)
	}
	method cuantos(partido) = ganadores.count{c=>c.partido() == partido}
}

class Resultado {
	var partido
	var cantidad
	constructor(p,c) {
		partido = p
		cantidad = c
	}
	method partido() = partido
	method cantidad() = cantidad
	method dividir(cociente) = new Resultado(partido,cantidad/cociente)
}
