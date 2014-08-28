class TransactionsController < ApplicationController
  ##
  # This is called by Blockchain when any of our wallets have received or sent
  # a transaction.
  def index
    value = params[:value] # in Satoshi
    input_address = params[:input_address]
    confirmations = params[:confirmations]
    transaction_hash = params[:transaction_hash]
    input_transaction_hash = params[:input_transaction_hash]
    destination_address = params[:destination_address]

    Bet.mark_paid!(input_address, value)

    render nothing: true, status: 200
  end
end
