class Figura
	def calcular_area
	end
end
class Triangulo < Figura
  attr_accessor :a,:b
  def initialize(a, b)
  	@a,@b = a,b
  end
  def calcular_area
  	b*a/2.0
  end
end
class Rectangulo < Figura
    attr_accessor :a, :b
    def initialize(a, b)
    	@a,@b=a,b
    end
	def calcular_area
		a*b
    end
end
class Circulo < Figura
    attr_accessor :radio
    def initialize(radio)
      @radio=radio
    end
  def calcular_area
     3.1415*radio*radio
    end
end

class Factoria                              # f = Factoria.new     f.create("c", 4)  ==> Factoria.create("c",4)
  def self.create(tipo, *arg)
     case tipo
     when "t"
     	 return Triangulo.new(arg[0],arg[1])
     when "r"
       return	Rectangulo.new(arg[0],arg[1])   
      when "c"
       return Circulo.new(arg[0])     	 
     end
  end
end

###
t = Triangulo.new(2,4)
puts "Triangulo Clasica area:#{t.calcular_area}"

f = Factoria.create("t",2,4)
puts "Trinagulo Con factory area:#{f.calcular_area}"

circ = Factoria.create("c",5)
puts "Circulo con Factory area: #{circ.calcular_area}"