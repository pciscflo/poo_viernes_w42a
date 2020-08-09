class Cliente 
	attr_accessor :nombre, :direccion, :dni
	def initialize(nombre,direccion,dni)
		@nombre = nombre
		@direccion = direccion
		@dni = dni
	end
end

class Celular
	attr_accessor :saldo
	def initialize(numeroCelular,codigoCiudad,saldo)
		@numeroCelular = numeroCelular
		@codigoCiudad = codigoCiudad
		@saldo	= saldo
	end
	def recargar(monto)
		@saldo = saldo + monto
	end	
end

cli = Cliente.new("Carmen", "Lima", "88888888")
celu = Celular.new("99999999", 12, 100)

puts "Nombre:#{cli.nombre}"
puts "Saldo inicial : #{celu.saldo}"
celu.recargar(30)
puts "Saldo final :  #{celu.saldo}"



