import plantas.*
import inta.*

class Parcela {
	var property ancho
	var property largo
	var property solHoras;
	const  plantas = []
	

	
	method getPlantas() = plantas
	
	method superficie() = ancho * largo;
	
	method maxCultivos(){
		if( ancho > largo){
			return self.superficie() /5
		} else {
			return self.superficie() / 3 + largo
		}
	}
	
	method cultivoComplicado(){
		return plantas.any({planta => solHoras > planta.horasToleraSol()})
	}
	
	method agregarCultivo(planta){
		if( plantas.size() == self.maxCultivos() )
			self.error("ERROR: No se puede agregar mas cultivos.")
			
		if( (solHoras - planta.horasToleraSol()) >= 2)
			self.error("ERROR: el cultivo no puede tolerar el sol de la parcela")
			
		plantas.add(planta)
	}
	
	//parte 5
	method seAsociaBien(planta)
}

//parte 5
class ParcelaEcologica inherits Parcela {
	
	override method seAsociaBien(planta){
		return !self.cultivoComplicado() && planta.parcelaIdeal(self)
	}
}

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBien(planta){
		return plantas.size() <= 2 && planta.esFuerte()
	}
}