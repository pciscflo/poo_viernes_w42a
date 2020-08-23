=begin
Una empresa desea calcular el sueldo a pagar a un grupo de trabajadores.
Los trabajadores pueden ser de dos tipos: Asociados o Contratados. 
En el caso de los Contratados el sueldo se calcula mediante la fórmula:
Horas Trabajadas * Precio por Hora. 
En el caso de los Asociados el sueldo debe calcular:
Horas Trabajadas * Precio por Hora + bono de 100 soles
1) El administrador deberá presentar el total de los sueldos a pagar.
2) El promedio de sueldos de los trabajadores Contratados
3) Los datos del trabajador que gana más, considerar que no hay empates.
=end

class Trabajador
	attr_accessor :tipo, :horas, :precioHora
	def initialize(tipo, horas, precioHora)
		@tipo=tipo
		@horas=horas
		@precioHora=precioHora
	end
	def calcularSueldo
		sueldo = 0
		if tipo=="Contratado"
			sueldo = horas*precioHora
		elsif tipo=="Asociado"
			sueldo = horas*precioHora + 100
		end				
	end
end

class Administrador
	attr_accessor :arregloTrabajadores
	def initialize
		@arregloTrabajadores = []
	end
	def registrar(trabajador)
		arregloTrabajadores.push(trabajador)
	end
	def calcularTotalSueldos
		suma =0 
		for trabajador in arregloTrabajadores
			suma+=trabajador.calcularSueldo
		end		
		return suma
	end
	def calcularPromedioSueldosContratados
         sumaSueldosContratados=0
         contadorContratados=0
         for trabajador in arregloTrabajadores
          if (trabajador.tipo="Contratado")
               sumaSueldosContratados+=trabajador.calcularSueldo
               contadorContratados += 1
           end
         end
         return sumaSueldosContratados/contadorContratados
	end

end

adm = Administrador.new
t1 = Trabajador.new("Contratado", 40, 40)
t2 = Trabajador.new("Contratado", 30, 40)
t3 = Trabajador.new("Asociado", 60, 30)
adm.registrar(t1)
adm.registrar(t2)
adm.registrar(t3)
puts "Total de Sueldos #{adm.calcularTotalSueldos}"




