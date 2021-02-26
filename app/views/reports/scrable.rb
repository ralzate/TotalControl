class scrabble
    def ingresar_palabra
        puts 'Ingresar una palabra'
        palabra = gets.chomp.to_s

        palabra.split()
    end
end