import parcelas.*
import inta.*

class Planta{
	
	var property anioCosecha;
	var property altura;
	
	method horasToleraSol()
	
	method esFuerte() = self.horasToleraSol() > 10
	
	method daSemillasNuevas() = self.esFuerte()
	
	method espacio()
	
	//parte 4
	method parcelaIdeal(parcela)
}

class Menta inherits Planta {
	
	override method horasToleraSol() = 6
	
	override method daSemillasNuevas(){
		return super() || altura > 4
	}
	
	override method espacio() = altura * 3
	
	//parte 4
	override method parcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta {
	
	override method horasToleraSol(){
		if( altura < 0.5 ) {
			return 6
		} else if ( altura.between(0.5,1) )
		{
			return 7
		} else return 9
	}
	
	override method daSemillasNuevas(){
		return super() || (anioCosecha > 2007 && altura > 1)
	}
	
	override method espacio() = altura / 2
	
	//parte 4
	override method parcelaIdeal(parcela) {
		return parcela.solHoras() == self.horasToleraSol()
	}
}

class Quinoa inherits Planta {
	
	var horasSol;
	
	method horasBajoSol(horas){
		horasSol = horas;
	}
	
	override method horasToleraSol() = horasSol
	
	override method espacio() = 0.5
	
	override method daSemillasNuevas(){
		return super() || anioCosecha < 2005
	}
	
	//parte 4
	override method parcelaIdeal(parcela) {
		return parcela.getPlantas().all({planta => planta.altura() < 1.5})
	}
}

//parte 2
class Transgenica inherits Soja{
	override method daSemillasNuevas() = false
	
	//parte 4
	override method parcelaIdeal(parcela) {
		return parcela.maxCultivos() == 1
	}
}

class Hierbabuena inherits Menta{
	override method espacio() = super() * 2
}
