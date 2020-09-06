class Envio
   attr_reader :codigoEnvio, :volumenMetrico, :categoriaEnvio
   def initialize(codigoEnvio, volumenMetrico, categoriaEnvio)
       @codigoEnvio = codigoEnvio
       @volumenMetrico = volumenMetrico
       @categoriaEnvio = categoriaEnvio
   end
   def calcularCosto
   end
   def dameTipo
   end
end
class EnvioMaritimo < Envio
	attr_reader :razonSocial
	def initialize(codigoEnvio, volumenMetrico, categoriaEnvio, razonSocial)
		super(codigoEnvio, volumenMetrico, categoriaEnvio)
		@razonSocial = razonSocial
    end
    def calcularCosto
    	volumenMetrico*100 + (volumenMetrico*categoriaEnvio)*25
    end
    def dameTipo
    	 return "Maritimo"
    end
end

class EnvioUltramarino < Envio
	attr_reader :codigoEmpresaContratante, :nombreRepresentante
	def initialize(codigoEnvio, volumenMetrico, categoriaEnvio, codigoEmpresaContratante, nombreRepresentante)
	   super(codigoEnvio, volumenMetrico, categoriaEnvio)
	   @codigoEmpresaContratante = codigoEmpresaContratante
	   @nombreRepresentante = nombreRepresentante
	end
	def calcularCosto
		volumenMetrico*500 + volumenMetrico*10*categoriaEnvio*10
	end
	def dameTipo
    	 return "Ultramarino"
    end
end

class Jefe
	attr_reader :arregloEnvios
	def initialize
		@arregloEnvios = []
	end
	def registrar(envio)
         validarCodigo(envio.codigoEnvio)
       	 puts "Registrando el envio"
		     arregloEnvios.push(envio)
	end
	def validarCodigo(codigo) # return true si lo encuentra 
		for envio in arregloEnvios
			if envio.codigoEnvio == codigo
				raise "El codigo ya existe"
			end
		end
	end
	def calcularCostoEnvio(codigoEnvio)
       for envio in arregloEnvios
       	  if envio.codigoEnvio == codigoEnvio
              return envio.calcularCosto ##okkk polimorfismo
       	  end
       end
       return nil
	end

	def imprimirEnviosMaritimos
        for envio in arregloEnvios
        	if  envio.dameTipo == "Maritimo"
                puts "#{envio.codigoEnvio} .....#{envio.volumenMetrico}"
            end
        end
    end
end
###### Probar Pantalla del Cliente ##############33

em1 = EnvioMaritimo.new("001", 200, 1, "El Farol")
emu1 = EnvioUltramarino.new("002", 120, 3, "EMP01", "Luis Torres")
em2 = EnvioMaritimo.new("003", 220, 2, "El Naviero")
em3 = EnvioMaritimo.new("003", 212, 1, "El Pozo")
emu2 = EnvioUltramarino.new("004", 50, 4, "EMP02", "Juan Perez")
jefe = Jefe.new
begin
    jefe.registrar(em1)
rescue Exception =>e
   puts e.message
end
begin
   jefe.registrar(emu1)
rescue Exception =>e
   puts e.message
end
begin
   jefe.registrar(em2)
rescue Exception =>e
   puts e.message
end
begin
   jefe.registrar(em3)
rescue Exception =>e
   puts e.message
end
begin
   jefe.registrar(emu2)
rescue Exception =>e
   puts e.message
end

jefe.imprimirEnviosMaritimos
puts jefe.calcularCostoEnvio("001")







