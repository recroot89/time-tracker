# frozen_string_literal: true

class Web::ReportsController < Web::ApplicationController
  def index
    @current_company = current_user.companies.find(params[:company_id])
  end

  def show
    @department = Department.find(report_params[:department])
    @year = report_params[:year].to_i
    @month = report_params[:month].to_i
    # binding.pry
  end

  private

  def report_params
    params.require(:report).permit(:department, :year, :month)
  end
end
