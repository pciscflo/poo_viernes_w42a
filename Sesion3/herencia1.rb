class Profesor
	attr_accessor :codigo, :dni, :nombre
	def initialize(codigo, dni, nombre)
		@codigo=codigo
		@dni=dni
		@nombre=nombre
	end
	def calcularSueldo
	end
	def dameTipo
	end
end
class ProfesorTC  < Profesor
   attr_accessor :sueldoFijo, :porAfp
   def initialize(codigo, dni, nombre, sueldoFijo, porAfp)
   	super(codigo, dni, nombre)
   	@sueldoFijo=sueldoFijo
   	@porAfp =porAfp
   end
   def calcularSueldo
   	sueldoFijo - porAfp*sueldoFijo
   end
   	def dameTipo
   		"TC"
	end
end
class ProfesorTP < Profesor
   attr_accessor :horas, :tarifaHora
   def initialize(codigo, dni, nombre, horas, tarifaHora)
   	  super(codigo, dni, nombre)
   	  @horas = horas
   	  @tarifaHora = tarifaHora
   end
   def calcularSueldo
   	  horas*tarifaHora
   end
   	def dameTipo
   		"TP"
	end
end

class Administrador
	attr_accessor :profesores
	def initialize
		@profesores =[]
	end
	def registrar(profesor)
		profesores.push(profesor)
	end
	def calcularPlanillaProfesoresParcial
		suma =0
		for profesor in profesores
			if profesor.dameTipo == "TP"
			  suma+=profesor.calcularSueldo
			end
		end
		return suma
	end

end


ptp1 = ProfesorTP.new("30405", "88888888", "Luis", 10, 30)
ptc1 = ProfesorTC.new("45565", "99999999", "Jorge", 2000, 0.11)

adm = Administrador.new
adm.registrar(ptp1)
adm.registrar(ptc1)

puts "Planilla de profesores a tiempo parcial: #{adm.calcularPlanillaProfesoresParcial}"







