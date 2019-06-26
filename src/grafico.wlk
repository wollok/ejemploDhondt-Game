import wollok.game.*

class Item {
//	var valor
	var property position
	const property image = "cuadradoliso.jpg"
	
	method dibujar(){
		game.addVisual(self)
	}
}

class BarraVertical {
	var valor
	var position
	
	method dibujar(){
		if(valor > 0 )
			valor.times{i=> 
				new Item(position = position).dibujar()
				position = position.up(1) 
			}
	}
}

class GraficoBarras {
	var valores
	var etiquetas = []
//	const escala = 100
	var property position
	
	method dibujar() {
		var pos = position
		valores.forEach{valor => 
			new BarraVertical(valor = valor,position = pos).dibujar()
			pos = pos.right(2)
		}
		pos = position.down(2)
		etiquetas.forEach{e=>
			game.addVisualIn(e,pos) 
			pos = pos.right(2)
		}
		pos = position.left(2)
		10.times{i=>
			game.addVisualIn(new Visual(image = "nro"+i+".png"),pos)
			pos = pos.up(1)
		}

		
	}	
}

class Visual{
	const property image 
}