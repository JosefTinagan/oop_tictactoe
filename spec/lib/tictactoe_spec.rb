require 'spec_helper'
require 'tictactoe'

describe TicTacToe do

	xit "have a name attribute" do
		tt = TicTacToe.new("Jake")
		param = tt.name
		expect(param).to eq("Jake")
	end

	xit "only two instances" do
		tt = TicTacToe.new("Jems")
		param = tt.number_of_players
		expect(param).to eq(1)
	end

	it "working turn" do
		tt = TicTacToe.new("Vake")
		param = tt.turn
		expect(param).to eq ("Vake")
	end

	xit "working sign" do
		tt = TicTacToe.new("Lel")
		param = tt.sign
		expect(param).to eq ("X")
	end

	xit "have a game board" do
		param = TicTacToe.game_board
		expect(param).to eq("Board here")
	end

	
end