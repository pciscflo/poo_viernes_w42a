class Juego
    def initialize(resultado1, resultado2)
      @resultado1 = resultado1
      @resultado2 = resultado2
    end
    def lanzar
         @resultado1 = rand(1..6)
         @resultado2 = rand(1..6)
    end
    def obtenerResultado
         suma = @resultado1 + @resultado2   	 
         if suma==7 or suma==11
             return "Pierde"
         elsif suma==2 or suma==12
         return "Gana"
      else
          return "Indefinido"
         end   	 		
    end
    def dameResultado1
        return @resultado1
    end
    def dameResultado2
        return @resultado2
    end
 end
 
 juego1 = Juego.new(0,0)
 juego1.lanzar
 puts "Dado1: #{juego1.dameResultado1}"
 puts "Dado2:" + juego1.dameResultado2.to_s
 puts juego1.obtenerResultado