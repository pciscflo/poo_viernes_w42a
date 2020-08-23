class Mascota
  def initialize(codigo, nombre, peso ,estado)
    @codigo=codigo
    @nombre=nombre
    @peso=peso
    @estado=estado
  end
  def estado
    if @estado==true
      return true
    elsif @estado==false
      return false
    end       
  end
  def pesoMascota
    return @peso
  end
end

class Veterinaria
  attr_accessor :arregloMascota
  def initialize
    @arregloMascota = []
  end
  def registrar(mascota)
    arregloMascota.push(mascota)
  end
  def calcularPesoMascota
    suma =0 
    for mascota in arregloMascota
      suma+=mascota.pesoMascota
    end   
    return suma/arregloMascota.length()
  end
  def contarVacunados
    vacunada =0
    novacunada =0
         for mascota in arregloMascota
          if mascota.estado == true
               vacunada += 1
          else 
              novacunada += 1
           end
         end
         return vacunada, novacunada
  end

end

vet = Veterinaria.new
m1 = Mascota.new(1250, "dogol", 10, true)
m2 = Mascota.new(2222, "boby", 20, false)
m3 = Mascota.new(1478, "brandon", 30, false)
vet.registrar(m1)
vet.registrar(m2)
vet.registrar(m3)
puts "total de vacunado #{vet.contarVacunados[0]} total no vacunado #{vet.contarVacunados[1]}"
puts "Promedio de Peso #{vet.calcularPesoMascota}"