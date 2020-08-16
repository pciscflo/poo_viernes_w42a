class DetalleVenta
	def initialize(cantidad, descripcion, precio)
		@cantidad, @descripcion, @precio = cantidad, descripcion, precio
	end
	def calcularValorVenta
		@precio*@cantidad
	end
end
class DocumentoFactura
	def initialize(numeroFactura, ruc, fecha, razonSocial)
		@arregloDetalles = []
		@numeroFactura=numeroFactura
		@ruc=ruc
		@fecha=fecha
		@razonSocial=razonSocial
	end
	def agregar(detalle)
		@arregloDetalles.push(detalle)
	end
	def calcularSubTotal
		suma = 0
		for detalle in @arregloDetalles
			suma += detalle.calcularValorVenta 
		end
		return suma
	end
	def calcularIGV
		return calcularSubTotal*0.18
	end
	def calcularTotal
		return calcularSubTotal + calcularIGV
	end
end
#Test
d1 = DetalleVenta.new(2,"Coca Cola", 2.5)
d2 = DetalleVenta.new(1, "Pepsi", 2.0)
factura = DocumentoFactura.new("111-123", "99999999", "12/08/2020", "El Palmar")
factura.agregar(d1)
factura.agregar(d2)

puts("Sobtotal: #{factura.calcularSubTotal}")
puts("IGV: #{factura.calcularIGV}")
puts("Total: #{factura.calcularTotal}")
