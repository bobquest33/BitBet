class QrsController < ApplicationController
	def show
		@bet = Bet.find(params[:bet_id])
  end
end