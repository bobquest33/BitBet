class BetsController < ApplicationController
  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    if @bet.save
      render text: "made your bet: #{@bet.id}"
    else
      render @bet
    end
  end

  private

  def bet_params
    params.require(:bet).permit(:description, :amount, :you, :friend, :judge )
  end
end
