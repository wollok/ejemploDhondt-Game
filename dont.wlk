class Dont {
	const valores
	const cargos
	var ganadores = []
	var property totales = []
	
	method initialize() {
		const resultados = valores.map(
			{ valor => new Resultado(partido = valor.key(), cantidad = valor.value()) }
		)
		const cocientes = []
		cargos.times(
			{ cociente => cocientes.addAll(
					resultados.map(
						{ resultado => new Resultado(
								partido = resultado.partido(),
								cantidad = resultado.cantidad() / cociente
							) }
					)
				) }
		)
		cocientes.sortBy({ a, b => a.cantidad() > b.cantidad() })
		ganadores = cocientes.take(cargos)
		totales = resultados.map(
			{ resultado => new Resultado(
					partido = resultado.partido(),
					cantidad = self.cuantos(resultado.partido())
				) }
		) //		.sortedBy{a,b=>a.cantidad() > b.cantidad()}
	}
	
	method cuantos(partido) = ganadores.count(
		{ resultado => resultado.partido() == partido }
	)
	
	method partidos() = totales.map({ resultado => resultado.partido() })
	
	method cantidades() = totales.map({ resultado => resultado.cantidad() })
}

class Resultado {
	var property partido
	var property cantidad
}