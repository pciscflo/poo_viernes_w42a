class Concursante
	attr_reader :dni, :nombre, :apellido, :edad, :cantidadMensajesTxt
	def initialize(dni, nombre, apellido, edad, cantidadMensajesTxt)
		@dni = dni
		@nombre = nombre
		@apellido =apellido
		@edad =edad
		@cantidadMensajesTxt = cantidadMensajesTxt
	end
	def calcularPuntaje
	end
end

class FanMasacre < Concursante
	attr_reader :equipo, :puntajeBarra, :puntajeEquipo
	def initialize (dni, nombre, apellido, edad, cantidadMensajesTxt, equipo, puntajeBarra, puntajeEquipo)
		super(dni, nombre, apellido, edad, cantidadMensajesTxt)
		@equipo = equipo
		@puntajeBarra = puntajeBarra
		@puntajeEquipo = puntajeEquipo
	end
	def calcularPuntaje
		cantidadMensajesTxt*4 + puntajeBarra + puntajeEquipo*2
	end
end

class Televidente < Concursante
   attr_reader :numeroTel, :cantidadLlamadas;

   def initialize(dni, nombre, apellido, edad, cantidadMensajesTxt, numeroTel, cantidadLlamadas)
	   	super(dni, nombre, apellido, edad, cantidadMensajesTxt)
	   	@numeroTel =numeroTel
	   	@cantidadLlamadas = cantidadMensajesTxt	   	
   end
   def calcularPuntaje
		cantidadMensajesTxt*4 + cantidadLlamadas*3
	end
end

class Administrador
	attr_reader :arregloConcursantes
	def initialize
		@arregloConcursantes = []
	end
	def registrar(concursante)
		arregloConcursantes.push(concursante)
	end
	def imprimirListadoConcursantes
       for concursante in arregloConcursantes
       	 puts "#{concursante.nombre} #{concursante.calcularPuntaje}"
       end
	end
	def obtenerGanador
	    maximo = 0
	    objeto = nil
       for concursante in arregloConcursantes
       	   if concursante.calcularPuntaje > maximo
       	   	 maximo = concursante.calcularPuntaje
       	   	 objeto = concursante
       	   end
       end
       return objeto
	end
end

### test ########

fan1 = FanMasacre.new("88888888", "Anibal", "Pardo", 28, 200, "nuclear", 100, 150)
fan2 = FanMasacre.new("99999999", "Carmen", "Loret", 32, 130, "nuclear", 80, 120)
tev1 = Televidente.new("77777777", "Luis", "Perez", 29, 200, "3484859", 140)

administrador = Administrador.new
administrador.registrar(fan1)
administrador.registrar(fan2)
administrador.registrar(tev1)

administrador.imprimirListadoConcursantes

puts "*************************"
gana = administrador.obtenerGanador
puts "Ganador: #{gana.nombre}  #{gana.calcularPuntaje}"
puts "******** Listado 2 **********"
va = administrador.arregloConcursantes
for concursante in va
	puts "#{concursante.nombre}   #{concursante.apellido}  #{concursante.calcularPuntaje}"
end


