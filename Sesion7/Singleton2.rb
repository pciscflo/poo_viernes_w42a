require 'singleton'
 
class AppConfig
  include Singleton
  def inicio(a)
  	@a = a
  end
  def mostrar
  	 "Hello #{@a}" 
  end
  def cambiar(x) #sincronizar
  	@a = x
  end
end

ap = AppConfig.instance
ap.inicio("Carlos")
puts ap.mostrar
ap1 = AppConfig.instance
puts ap1.mostrar
if ap == ap1
	puts "Iguales"
else
	puts "Diferentes"
end