class QrsController < ApplicationController
  def show
    @bet = Bet.find(params[:bet_id])
    @person = params[:id]
  end
end
