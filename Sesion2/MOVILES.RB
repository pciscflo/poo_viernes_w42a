class Cliente
	attr_accessor :nombre, :direccion, :dni
	def initialize(nombre, direccion, dni)
		@nombre = nombre
		@direccion = direccion
		@dni = dni
	end
end

class Celular
	attr_accessor :saldo
	def initialize (numero, codigodeciudad, saldo)
		@numero = numero
		@codigodeciudad = codigodeciudad
		@saldo = saldo
	end
	def recargar(monto)
		@saldo = @saldo + monto
	end 
end 

cli = Cliente.new("raul", "lima", "9999999")
celu = Celular.new("999999999", 15, 100000)

puts "Nombre:#{cli.nombre}"
puts "Saldo inicial :#{celu.saldo}"
celu.recargar(30) #no retorna valor sólo actualiza
puts "saldo final : #{celu.saldo}"



