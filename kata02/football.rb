class Football

	def initialize
		@arrayDatos = Array.new
		@arrayFinal = Array.new
	end


	def guardarDatos
		lineNumber = 0.to_i
		File.open("football.dat").each do |line|
			@arrayDatos[lineNumber] = line.to_s.split
			lineNumber += 1
		end
		mostrarDatos

	end

	def mostrarDatos
		@arrayDatos.delete_at(0)
		@arrayDatos.delete_at(17)
		@arrayDatos.delete_at(@arrayDatos.count - 1)
		count = 0
		@arrayDatos.each { |line|
			print line[1], " -> ",((line[6].to_i) - line[8].to_i).abs, "\n"

			@arrayFinal[count] = ((line[6].to_i) - line[8].to_i).abs
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
        puts "El equipo con la menor diferencia de goles es: #{@arrayDatos[iMenor][1]} -> #{@arrayFinal[iMenor]}"


	end
end

main=Football.new
main.guardarDatos