class DailyCostsController < ApplicationController
  include DailyCostsHelper
  def index

  end

  def show
    
  end

  def new
    @daily_cost = DailyCost.new
  end

  def create
    daily_cost = DailyCost.new(daily_cost_params)
    if daily_cost.save
      render action: :new, status: 201
    else
      flash.now[:danger] = 'Invalid parameter'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    DailyCost.find(params[:id]).destroy
    flash[:success] = "Delete Complete"
    redirect_to home_index_path
  end

  def edit
    @daily_cost = DailyCost.find(params[:id])
  end

  def update
    @daily_cost = DailyCost.find(params[:id])
    if @daily_cost.update(daily_cost_params)
      flash[:success] = "Update complete"
      redirect_to daily_costs_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  private
    def daily_cost_params
      params.require(:daily_cost).permit(:pay_day, :category_id, :detail, :price)
    end

end
