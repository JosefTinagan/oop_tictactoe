require 'spec_helper'
require 'tictactoe'

describe TicTacToe do

	it "testing" do
		tt = TicTacToe.new
		param = tt.test
		expect(param).to eq("responding...")
	end

end