
def readData
	#variable para numerar las posiciones del arreglo
	lineNumber = 0.to_i
	lineRead = []
	#apertura e iteracion del archivo
	File.open("weather.dat").each do |line|
		#guardado de palabras en renglones
		lineRead[lineNumber] = line.to_s.split
		lineNumber += 1
	end
	lineRead.delete_at(1)
	lineRead.delete_at(lineRead.count - 1)
	lineRead.each { |line|
		print line[0], " -> ",line[2], "\n"
	}
end

	readData
