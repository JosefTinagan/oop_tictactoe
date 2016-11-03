class TicTacToe
	attr_accessor :name
	attr_reader :sign

	@@turn = 0
	@@players = 0
	@@tl = " "
	@@t  = " "
	@@tr = " "
	@@ml = " "
	@@m  = " " 
	@@mr = " "
	@@bl = " " 
	@@b  = " " 
	@@br = " "

	def initialize(name="You")
		@name = name
		@sign = pick_sign
		@@players += 1

		
	end

	def pick_sign
		puts "Pick your sign? (X or O)"
		x = gets.chomp
		if x.upcase == "X" || x.upcase == "O"
			return x.upcase
		else
			puts "Not a valid option, try again"
			pick_sign()
		end
	end

	def turn 
		if @@turn == 9
			game_over()
		end

		puts "#{@name} is playing"
		puts "Your sign is #{@sign}"
		puts "Board: "
		TicTacToe.game_board
		puts "Where should you put your sign?"
		puts "   TL[Top Left],    T[Top],    Tr[Top Right]"
		puts "ML[Middle Left], M[Middle], MR[Middle Right]"
		puts "BL[Bottom Left], B[Bottom], BR[Bottom Right]"
		choice = gets.chomp
		change_board(choice)

		puts "Updated Board:"
		TicTacToe.game_board

		
		@@turn += 1
	end

	def change_board(choice)
		#@@temp_array.push(choice.upcase)
		case choice.upcase
		when "TL" then @@tl = "#{@sign}"
		when "T"  then @@t  = "#{@sign}"
		when "TR" then @@tr = "#{@sign}"
		when "ML" then @@ml = "#{@sign}"
		when "M"  then @@m  = "#{@sign}"
		when "MR" then @@mr = "#{@sign}"
		when "BL" then @@bl = "#{@sign}"
		when "B"  then @@b  = "#{@sign}"
		when "BR" then @@br = "#{@sign}"
		else 
			puts 
			puts "Not a valid choice... Try again"
			turn()
		end	
	end

	def self.game_board
		print "#{@@tl} #{@@t} #{@@tr}"
		puts
		print "#{@@ml} #{@@m} #{@@mr}"
		puts
		print "#{@@bl} #{@@b} #{@@br}"
		puts
		return "Board here"
	end

	def number_of_players
		@@players
	end

	def game_over
		puts "Game over"
		exit
	end
end

player1 = TicTacToe.new
player2 = TicTacToe.new("Player2")
#TicTacToe.game_board
player1.turn
player2.turn
player1.turn
player2.turn
player1.turn
player2.turn
player1.turn
player2.turn
player1.turn
player2.turn