class Trabajador
	attr_accessor :dni, :nombre, :apellido, :sueldoBase, :tipo
	def initialize(dni, nombre, apellido, sueldoBase, tipo)
		@dni = dni
		@nombre = nombre
		@apellido = apellido
		@sueldoBase = sueldoBase
		@tipo = tipo
	end
	def calcularBono2
		case tipo
		when "Planilla"
			return 300
		when "Por horas"
		    return 400
		when "Parcial"
		    return 500			
		end
	end
	def calcularBono
      if tipo=="Planilla"
      	bono=300
      elsif tipo=="Por horas"
      	bono = 400
      elsif tipo=="Parcial"
        bono = 500          		
      end
      return bono
	end

	def calcularSueldoFinal
		return sueldoBase +  calcularBono
	end
end

trabajador1 = Trabajador.new("88888888", "Pedro", "Perez", 2400, "Parcial")
puts trabajador1.nombre
puts trabajador1.calcularSueldoFinal
puts trabajador1.calcularBono
puts trabajador1.calcularBono2
puts "---------------------:)"