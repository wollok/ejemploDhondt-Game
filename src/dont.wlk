/** First Wollok example */
class Dont {
	var cocientes = []
	var resultados = []
	var ganadores = []
	var property totales = []
	var cargos
	
	method agregarResultado(partido,cantidad) {
		resultados.add(new Resultado(partido = partido,cantidad = cantidad))
	}
	method calcular() {
		cargos.times{i=>
			cocientes.addAll(resultados.map{r=>r.dividir(i)})
		}
		cocientes.sortBy{a,b=>a.cantidad()>b.cantidad()}
		ganadores = cocientes.take(cargos)
		totales = resultados.map{resultado => new Resultado(partido = resultado.partido(), cantidad =  self.cuantos(resultado.partido()))}
			.sortedBy{a,b=>a.cantidad() > b.cantidad()}
		
	}
	method cuantos(partido) = ganadores.count{c=>c.partido() == partido}
}

class Resultado {
	var property partido
	var property cantidad
	
	method dividir(cociente) = new Resultado(partido = partido,cantidad = cantidad/cociente)
}
