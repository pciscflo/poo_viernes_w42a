class Auto
	def initialize(codigo, marca, precio)
		@codigo=codigo
		@marca=marca
		@precio=precio
	end
	def calc_igv
		@precio*0.18
	end
	def calc_descuento
        @precio*0.10
	end
end
#Test
o1 = Auto.new(1003, "Volvo", 20000)
o3 = Auto.new(4535,"Toyota", 25000)
autos = []
autos.push(o1)
autos.push(o3)
#imprimiendo en pantalla a todos los descuentos de los autos del arreglo
for auto in autos
   puts auto.calc_descuento
end
puts "*******************"
suma = 0
for auto in autos
  suma = suma + auto.calc_descuento
end
puts "Suma de descuentos: #{suma}"
puts "*******************"
puts autos






