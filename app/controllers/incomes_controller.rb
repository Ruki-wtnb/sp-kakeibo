class IncomesController < ApplicationController
  
  def new
    @income = Income.new
  end

  def create
    income = Income.new(income_params)
    if income.save
      redirect_to action: :new
    else
      flash.now[:danger] = 'Invalid Parameter'
      render 'new', status: :unprocessable_entity
    end
  end

  private
  def income_params
    params.require(:income).permit(:price, :year_month)
  end
end
