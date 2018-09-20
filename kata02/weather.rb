class Weather

	def initialize
		@arrayDatos = Array.new
		@arrayFinal = Array.new
	end

	def mostrarDatos(count)
		for i in 1..count
			puts @arrayDatos[i];
		end
		separar(count)	
	end

	def guardarDatos
		lineNumber = 0.to_i
		File.open("weather.dat").each do |line|
			@arrayDatos[lineNumber] = line.to_s.split
			lineNumber += 1
		end


		mostrarDatos

	end

	def mostrarDatos
		@arrayDatos.delete_at(1)
		@arrayDatos.delete_at(@arrayDatos.count - 1)
		count = 0
		@arrayDatos.each { |line|
			if line.include? "*"
				line.remove("*")
			end
			print line[0], " -> ",((line[1].to_i) - line[2].to_i), "\n"

			@arrayFinal[count] = ((line[1].to_i) - line[2].to_i)
			count += 1	
		}
		mostrarMenor
	end

	def mostrarMenor
        iMenor = 1;
        for i in 1..(@arrayFinal.length.to_i - 1)
        	if @arrayFinal[i] < @arrayFinal[iMenor]
        		iMenor = i
        	end
        end
        puts "El dia con la menor diferencia de temperatura es: #{iMenor} -> #{@arrayFinal[iMenor]}"


	end
end

main=Weather.new
main.guardarDatos