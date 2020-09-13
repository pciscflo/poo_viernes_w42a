require_relative  'enviosFactory'
###### Probar Pantalla del Cliente #############

em1 = Factoria.dameObjeto("em","001", 200, 1, "El Farol")
emu1 = Factoria.dameObjeto("eu","002", 120, 3, "EMP01", "Luis Torres")
em2 = Factoria.dameObjeto("em","003", 220, 2, "El Naviero")
em3 = Factoria.dameObjeto("em","003", 212, 1, "El Pozo")
emu2 = Factoria.dameObjeto("eu","004", 50, 4, "EMP02", "Juan Perez")
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
