class Concursante
	attr_reader :dni, :nombre, :apellido, :edad, :cantidadMensajesTxt
	def initialize(dni, nombre, apellido, edad, cantidadMensajesTxt)
		@dni = dni
		@nombre = nombre
		@apellido =apellido
		@edad =edad
		@cantidadMensajesTxt = cantidadMensajesTxt
	end
	def esMayor
		if edad>=18
			return true
		else
			return false				
		end
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
		if concursante.esMayor
		   arregloConcursantes.push(concursante)
		else
			raise "No es mayor de edad"
		end
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

       if(objeto == nil)
       	raise "No se pudo econtrar un ganador"
       end

       return objeto
	end
	def obtenerConcursante(dni)
		for concursante in arregloConcursantes
           if concursante.dni == dni 
           	 return concursante
           end
		end
		raise "el concursante con DNI: #{dni} no fue encontrado"
	end
end

### test ########

fan1 = FanMasacre.new("88888888", "Anibal", "Pardo", 12, 200, "nuclear", 100, 150)
fan2 = FanMasacre.new("99999999", "Carmen", "Loret", 32, 130, "nuclear", 80, 120)
tev1 = Televidente.new("77777777", "Luis", "Perez", 29, 200, "3484859", 140)

administrador = Administrador.new

begin
    administrador.registrar(fan1)
rescue Exception =>e
   puts e.message
end

begin
    administrador.registrar(fan2)
rescue Exception =>e
   puts e.message
end

begin
    administrador.registrar(tev1)
rescue Exception =>e
   puts e.message
end



administrador.imprimirListadoConcursantes

puts "*************************"
gana = administrador.obtenerGanador
puts "Ganador: #{gana.nombre}  #{gana.calcularPuntaje}"
puts "**************************"
begin
   administrador.obtenerConcursante("4545454545")
rescue Exception=>e
   puts e.message
end
