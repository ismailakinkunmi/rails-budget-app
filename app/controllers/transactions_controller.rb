class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Transaction.where(category_id: params[:category_id]).order('created_at DESC')
    @id = params[:category_id]
  end

  def new
    @id = params[:category_id]
  end

  def create
    transaction = Transaction.new(transaction_params)
    transaction.user_id = current_user.id
    redirect_to category_transactions_path(params[:transaction][:category_id])
    if transaction.save
      flash[:notice] = 'transaction created successfully'
    else
      flash[:alert] = 'Error occurred while creating the transaction'
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :category_id)
  end
end
