class TicTacToe
	attr_accessor :name
	attr_reader :sign

	temp_period = "."
	@@turn = 0
	@@players = 0
	@@game_board = Array.new(9,temp_period)
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
		
		if @@turn ==  9
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
		check_victory?() 
		@@turn += 1
	end

	def change_board(choice)
		#check if spot is taken
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
				@@turn -= 1
				turn()
		else
			case choice.upcase
			when "TL" then @@game_board[0] = "#{@sign}"
			when "T"  then @@game_board[1] = "#{@sign}"
			when "TR" then @@game_board[2] = "#{@sign}"
			when "ML" then @@game_board[3] = "#{@sign}"
			when "M"  then @@game_board[4] = "#{@sign}"
			when "MR" then @@game_board[5] = "#{@sign}"
			when "BL" then @@game_board[6] = "#{@sign}"
			when "B"  then @@game_board[7] = "#{@sign}"
			when "BR" then @@game_board[8] = "#{@sign}"
			else 
				puts 
				puts "Not a valid choice... Try again"
				@@turn -= 1
				turn()
			end

		@@arr_temp.push(choice)	
		end
		
	end

	def check_victory?
		number_of_x = 0
		number_of_o = 0

		#check top row
		for x in 0..2
			temp_a, temp_b = row_checking(x)
			number_of_x += temp_a
			number_of_o += temp_b
		end
		number_of_x, number_of_o = check_victory(number_of_x,number_of_o)
		
		#check middle row
		for x in 3..5
			temp_a, temp_b = row_checking(x)
			number_of_x += temp_a
			number_of_o += temp_b
		end
		number_of_x, number_of_o = check_victory(number_of_x,number_of_o)
		
		#check bottom row
		for x in 6..8
			temp_a, temp_b = row_checking(x)
			number_of_x += temp_a
			number_of_o += temp_b
		end
		number_of_x, number_of_o = check_victory(number_of_x,number_of_o)
		

		for x in 0..@@game_board.length - 1
			#left column
			if x == 0 || x == 3 || x == 6
				z = @@game_board[x]
				if z == "X" 
					number_of_x += 1	
				elsif z == "O"
					number_of_o += 1
				end
			end
		end
		number_of_x, number_of_o = check_victory(number_of_x,number_of_o)
		
		for x in 0..@@game_board.length - 1
			#middle column
			if x == 1 || x == 4 || x == 7
				z = @@game_board[x]
				if z == "X" 
					number_of_x += 1	
				elsif z == "O"
					number_of_o += 1
				end	
			end
		end
		number_of_x, number_of_o = check_victory(number_of_x,number_of_o)
		
		for x in 0..@@game_board.length - 1	
			#right column
			if x == 2 || x == 5 || x == 8
				z = @@game_board[x]
				if z == "X" 
					number_of_x += 1	
				elsif z == "O"
					number_of_o += 1
				end	
			end
		end
		number_of_x, number_of_o = check_victory(number_of_x,number_of_o)
		
	end
	
	def row_checking(x)
		y = 0
		z = 0
		if @@game_board[x] == "X"
					y += 1
		elsif @@game_board[x] == "O"
					z += 1
		end
		
		return y,z
		
	end

	def check_victory(number_of_x, number_of_o)
		if number_of_x == 3
			victory
		elsif number_of_o == 3
			victory
		else
			return 0,0
		end
	end

	def self.game_board
		@@game_board.each_with_index do |x,y|
			print "#{x} "
				if y == 2 || y == 5
					puts
				end
		end
			
	end

	def victory()
		puts
		puts "The #{@sign} sign is victorious!"
		if @name == "You"
			puts "#{@name} win!"
		else
			puts "#{@name} wins!"
		end
		exit
	end

	def game_over
		puts
		puts "Game over. No one wins!"
		exit
	end

	def number_of_players
		@@players
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