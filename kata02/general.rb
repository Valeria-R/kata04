class General

	def initialize
		@arrayDatos = Array.new
		@arrayFinal = Array.new
	end

	def Menu
		puts "Bienvenido al menu\n    1.Clima\n    2.Futbol\n    3.Salir"
		opcion = gets.chomp.to_i

			case opcion

			when 1
				guardarDatos("weather.dat")
			when 2
				guardarDatos("football.dat")
			when 3
				exit
			else
				puts "opcion no encontrada"
				
			end
		Menu()
	end

	def guardarDatos(archivo)
		lineNumber = 0.to_i
		File.open(archivo).each do |line|
			@arrayDatos[lineNumber] = line.to_s.split
			lineNumber += 1
		end

		if archivo == "weather.dat"
			mostrarClima
		else
			mostrarFutbol
		end
	end

	def mostrarClima
		@arrayDatos.delete_at(1)
		@arrayDatos.delete_at(@arrayDatos.count - 1)
		count = 0
		@arrayDatos.each { |line|
			if line.include? "*"
				line.remove("*")
			end

			@arrayFinal[count] = ((line[1].to_i) - line[2].to_i)
			count += 1	
		}
		darMenor(1)		
	end

	def mostrarFutbol
		@arrayDatos.delete_at(0)
		@arrayDatos.delete_at(17)
		@arrayDatos.delete_at(@arrayDatos.count - 1)
		count = 0
		@arrayDatos.each { |line|

			@arrayFinal[count] = ((line[6].to_i) - line[8].to_i).abs
			count += 1	
		}
		darMenor(2)		
	end

	def darMenor(tipo)
		iMenor = 1;
        for i in 1..(@arrayFinal.length.to_i - 1)
        	if @arrayFinal[i] < @arrayFinal[iMenor]
        		iMenor = i
        	end
        end

        if tipo == 1
        	puts "El dia con la menor diferencia de temperatura es: #{iMenor} -> #{@arrayFinal[iMenor]}"
        else
        	puts "El equipo con la menor diferencia de goles es: #{@arrayDatos[iMenor][1]} -> #{@arrayFinal[iMenor]}"
        end


	end


end

main = General.new

main.Menu