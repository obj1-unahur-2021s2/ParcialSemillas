import plantas.*
import parcelas.*
object inta{
	var property parcelas = []
	
	method promedioPlanta(){
		return parcelas.sum({parcela => parcela.getPlantas().size()}) / parcelas.size()
	}
	
	method parcelasAutosustentables(){
		return parcelas.filter({parcela => parcela.getPlantas().size() > 4}).
		max({parcela => parcela.getPlantas().count({planta => parcela.seAsociaBien(planta)})})
	}
}