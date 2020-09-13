require_relative  'enviosFactory'

#Usando MVC Para enviosFactory
class VistaEntrada
  def mostrarFormularioDatosEnvioMaritimo
     print "codigoEnvio:"
     codigoEnvio = gets.chomp.to_i
     print "volumenMetrico:"
     volumenMetrico = gets.chomp.to_f
     print "categoriaEnvio:"
     categoriaEnvio = gets.chomp.to_i
     print "razon Social:"
     razonSocial = gets.chomp.to_s
     datos = []
     datos.push(codigoEnvio, volumenMetrico, categoriaEnvio, razonSocial)
     return datos

  end
  def mostrarFormularioDatosEnvioUltramarino
  	print "codigoEnvio:"
     codigoEnvio = gets.chomp.to_i
     print "volumenMetrico:"
     volumenMetrico = gets.chomp.to_f
     print "categoriaEnvio:"
     categoriaEnvio = gets.chomp.to_i
     print "codigoEmpresaContratante:"
     codigoEmpresaContratante = gets.chomp.to_i
     print "nombreRepresentante:"
     nombreRepresentante = gets.chomp.to_s
     datos = []
     datos.push(codigoEnvio, volumenMetrico, categoriaEnvio, codigoEmpresaContratante, nombreRepresentante)
     return datos
  end
end
class VistaSalida
  def mostrarMensaje(m)
  	puts m
  end
  def mostrarReporte(arreglo)
  	 puts "********* Envios Maritimos ***********"
  	 for envio in arreglo
        	puts "#{envio.codigoEnvio} .....#{envio.volumenMetrico}   #{envio.calcularCosto}"
     end
  end
end
class Controlador
	attr_reader :vistaEntrada, :vistaSalida, :jefe
	def initialize(vistaEntrada, vistaSalida, jefe)
       @vistaEntrada = vistaEntrada
       @vistaSalida = vistaSalida
       @jefe = jefe
	end
	def registrarEnvio(tipo)
		if tipo=="em"
		  datos = vistaEntrada.mostrarFormularioDatosEnvioMaritimo
		  envio = Factoria.dameObjeto(tipo, datos[0], datos[1], datos[2], datos[3])
		else
		  datos = vistaEntrada.mostrarFormularioDatosEnvioUltramarino
		  envio = Factoria.dameObjeto(tipo, datos[0], datos[1], datos[2], datos[3], datos[4])
		end        
		jefe.registrar(envio)		
		vistaSalida.mostrarMensaje("Envio Registrado!")
	end
	def imprimeEnviosMaritimos
          arreglo = jefe.obtenerEnviosMaritimos
          vistaSalida.mostrarReporte(arreglo)
	end
end
####### Usuario ###### MVC1 ######
jefe = Jefe.new
vistaEntrada = VistaEntrada.new
vistaSalida = VistaSalida.new
controlador  = Controlador.new(vistaEntrada, vistaSalida, jefe)
### Acciones del usuario
controlador.registrarEnvio("em")
controlador.registrarEnvio("em")
controlador.imprimeEnviosMaritimos