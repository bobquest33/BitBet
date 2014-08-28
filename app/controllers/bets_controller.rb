class BetsController < ApplicationController
  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(bet_params)
    if @bet.save
      redirect_to bet_qr_url(@bet, :you)
    else
      render :new
    end
  end

  private

  def bet_params
    params.require(:bet).permit(:description, :amount, :you, :friend, :judge )
  end
end
