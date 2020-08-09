class Alumno #la clase se inicia con mayuscula y en singular
  def initialize(codigo, nombre, nota1, nota2)
  	@codigo = codigo
  	@nombre = nombre
  	@nota1 = nota1
  	@nota2 = nota2  	
  end
  def calcularPromedio #nombre de los metodos deben ser verbos o acciones==operación
  	(@nota1 + @nota2) / 2.0
  end
end

a1 = Alumno.new("20201233", "Pepe", 18, 20)
puts a1.calcularPromedio   #Ctrl + b


