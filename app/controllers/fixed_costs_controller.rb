class FixedCostsController < ApplicationController
  def new
    @fixed_cost = FixedCost.new
  end
  
  def create
    fixed_cost = FixedCost.new(fixed_cost_params)
    if fixed_cost.save
      redirect_to action: :new
    else
      flash.now[:danger] = 'Invalid parameter'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    FixedCost.find(params[:id]).destroy
    flash[:success] = "Delete Complete"
    redirect_to daily_costs_path
  end

  def edit
    @fixed_cost = FixedCost.find(params[:id])
  end

  def update
    @fixed_cost = FixedCost.find(params[:id])
    if @fixed_cost.update(fixed_cost_params)
      flash[:success] = "Update complete"
      redirect_to daily_costs_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end
  
  private
  def fixed_cost_params
    params.required(:fixed_cost).permit(:price, :category_id, :year_month)
  end
end
