
class Mascota
	attr_accessor :codigo, :nombre, :peso, :estado
	def initialize(codigo, nombre, peso, estado)
		@codigo, @nombre, @peso, @estado = codigo, nombre, peso, estado
	end
end
class Administrador
	attr_accessor :arregloMascotas
	def initialize
		@arregloMascotas = []
	end
	def registrar(mascota)
		arregloMascotas.push(mascota)
	end
	def contarMascotas(estado)
		contadorMascotas = 0
		for mascota in arregloMascotas
			if mascota.estado == estado
				contadorMascotas += 1
			end
		end
		return contadorMascotas
	end
	def calcularPromedioPeso
		sumaPesosMascotas = 0
		for mascota in arregloMascotas
			sumaPesosMascotas += mascota.peso
			end
		return sumaPesosMascotas/arregloMascotas.size
		
	end
end

adm = Administrador.new
m1 = Mascota.new("1234","Bailey",20,"Vacunado")
m2 = Mascota.new("2345","Ringo",30,"No Vacunado")
m3 = Mascota.new("3456","Yogui",10,"No Vacunado")
m4 = Mascota.new("4567","Chuspi",15,"No Vacunado")
adm.registrar(m1)
adm.registrar(m2)
adm.registrar(m3)
adm.registrar(m4)
puts "Cantidad de mascotas vacunadas: #{adm.contarMascotas("Vacunado")}"
puts "Cantidad de mascotas no vacunadas: #{adm.contarMascotas("No Vacunado")}"
puts "Promedio de pesos de las mascotas: #{adm.calcularPromedioPeso}"