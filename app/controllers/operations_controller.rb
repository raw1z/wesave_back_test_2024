# frozen_string_literal: true

class OperationsController < ApplicationController
  before_action :set_portfolio

  def create
    @operation = @portfolio.operations.create(operation_params)
    if @operation.valid?
      render json: @operation, status: :created
    else
      render json: @operation.errors, status: :unprocessable_entity
    end
  end

  private

  def set_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end

  def operation_params
    params.require(:operation).permit(:amount, :target_id)
  end
end
