=begin 
Una veterinaria exclusiva desea llevar un registro de sus mascotas.
Para ello se considera que cada mascota tiene un código, nombre,
peso y un estado que puede ser vacunado o no vacunado.
Desarrollar un programa que me permita contar la cantidad de mascotas
vacunadas y no vacunadas y el promedio de pesos de todas las mascotas,
teniendo que ingresar los datos de cada mascota.
Solucion:
=end
class Mascota
	attr_accessor :codigo, :nombre, :peso, :estado
	def initialize(codigo, nombre, peso, estado)
       @codigo = codigo
       @nombre = nombre
       @peso = peso
       @estado = estado
	end
end

class Verterinaria
    attr_accessor :arregloMascotas

    def initialize
		@arregloMascotas = []
	end

	def agregarMascota(mascota)
		arregloMascotas.push(mascota)
	end

	def cantidadMascotas(estado)
	 cantidad = 0
	  for mascota in arregloMascotas
          if (mascota.estado == estado)
               cantidad += 1
           end
       end
      return cantidad
    end

    def calcularPromedioDePesos()
     sumaPesos = 0
	 promedio = 0
	  for mascota in arregloMascotas
            sumaPesos += mascota.peso  
       end

       promedio = sumaPesos / arregloMascotas.size
       return promedio

    end
end

mascota1 = Mascota.new('001','boby', 10 , "vacunado" )
mascota2 = Mascota.new('002','ralf', 15 , "no vacunado")
mascota3 = Mascota.new('003','randy', 10 , "no vacunado")

veterianaria = Verterinaria.new()
veterianaria.agregarMascota(mascota1)
veterianaria.agregarMascota(mascota2)
veterianaria.agregarMascota(mascota3)
puts veterianaria.cantidadMascotas("vacunado")
puts veterianaria.cantidadMascotas("no vacunado")
puts veterianaria.calcularPromedioDePesos()



