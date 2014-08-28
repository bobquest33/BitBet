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

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
    if @bet.update(params[:bet])
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def bet_params
    params.require(:bet).permit(:description, :amount, :you, :friend, :judge )
  end
end
