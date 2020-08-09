class Worker

  def initialize(id, name, address, phone)
    @id = id
    @name = name
    @address = address
    @phone = phone
  end

  def get_data()
    puts "Cliente:"
    puts "Nombre: #{@name}"
    puts "Direccion: #{@address}"
    puts "ID: #{@id}"
  end
end


class Phone

  def initialize(number, area_code, credit)
    @number = number
    @area_code = area_code
    @credit = credit
  end

  def add_credit(extra)
    puts "Saldo actual: #{@credit}"
    @credit = @credit + extra
    puts "Saldo luego de la recarga: #{@credit}"
  end
end

ex = Phone.new(965874856, "+51", 20)
worker1 = Worker.new("85693457", "Juan","Ca. UPC", ex)

puts worker1.get_data
ex.add_credit(20)