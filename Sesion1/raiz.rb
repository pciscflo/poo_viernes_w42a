class Triangulo
	def initialize(lado1,lado2,lado3)
		@lado1 = lado1
		@lado2 = lado2
		@lado3 = lado3
	end

	def calcularSemiperimetro
        p = (@lado1 + @lado2 + @lado3) / 2.0
	end

	def calcularArea
		p = calcularSemiperimetro
		(p * (p-@lado1) * (p-@lado2) * (p-@lado3)) ** 0.5
	end

end

t1 = Triangulo.new(3,4,5)

puts "Area:  #{t1.calcularArea}  y su semiperimetro es : #{t1.calcularSemiperimetro}"