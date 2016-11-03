class TicTacToe
	attr_accessor :name
	attr_reader :sign

	@@turn = 0
	@@players = 0
	@@arr_board = Array.new(9)
	@@arr_temp = []

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
		check_victory?() 
		if @@turn == 9
			game_over()
		end
		puts "#{@name} is playing"
		puts "Your sign is #{@sign}"
		puts "Board: "
		TicTacToe.game_board
		puts; puts;
		puts "   TL[Top Left],    T[Top],    Tr[Top Right]"
		puts "ML[Middle Left], M[Middle], MR[Middle Right]"
		puts "BL[Bottom Left], B[Bottom], BR[Bottom Right]"
		puts "Where should you put your sign? :"
		choice = gets.chomp
		change_board(choice)

		puts "Updated Board:"
		TicTacToe.game_board
		puts
		
		@@turn += 1
	end

	def change_board(choice)
		taken = false
		@@arr_temp.each do |x|
			if x == choice
				taken = true
			end
		end

		if taken
			puts "This spot is already taken..."
				puts "Try again..."
				puts 
				turn()
		else
			case choice.upcase
			when "TL" then @@arr_board[0] = "#{@sign}"
			when "T"  then @@arr_board[1] = "#{@sign}"
			when "TR" then @@arr_board[2] = "#{@sign}"
			when "ML" then @@arr_board[3] = "#{@sign}"
			when "M"  then @@arr_board[4] = "#{@sign}"
			when "MR" then @@arr_board[5] = "#{@sign}"
			when "BL" then @@arr_board[6] = "#{@sign}"
			when "B"  then @@arr_board[7] = "#{@sign}"
			when "BR" then @@arr_board[8] = "#{@sign}"
			else 
				puts 
				puts "Not a valid choice... Try again"
				turn()
			end

		@@arr_temp.push(choice)	
		end
		
	end

	def self.game_board

		@@arr_board.each_with_index do |x,y|
			if x == nil
				@@arr_board[y] = "."
			end
			print "#{x} "
				if y == 2 || y == 5
					puts
				end
		end
			
	end

	def number_of_players
		@@players
	end

	def check_victory?
		count_x = 0
		count_o = 0
		
		for i in 0..2
			
			x = @@arr_board[i]
			if x == "X"
				count_x += 1
			elsif x == "O"
				count_o += 1
			end
			puts "X CHECKING: #{count_x}"
			if count_x == 3
				puts "Victory!"
			end
		end
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