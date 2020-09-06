class Calculadora
   attr_reader :a, :b
   def initialize(a, b)
   	@a = a
   	@b = b
   end
   def divide   
      a/b
   end
   def suma
   	 raise "no pueden ser ceros a y b" if a==0 and b==0
   	 return (a + b)
   end
end
class Maquina
	def initialize
	end
	def calcula1
       x = Calculadora.new(8,0)
       p = x.divide
       p = p + 1    
      return p
    end
    def calcula2
       x = Calculadora.new(0,1)
       p = x.suma
       return p
    end
end

maquina = Maquina.new
begin
  resultado = maquina.calcula1
   puts resultado
rescue Exception => e
    puts "ErrZERO"
end    




