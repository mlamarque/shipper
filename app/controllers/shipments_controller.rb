#class Api::V1::ShipmentsController < ApplicationController
class ShipmentsController < ApplicationController  
  def index
    company = Company.where(id: params[:company_id]).first
    if company
      return render json: {records: company.shipments_as_json({sort: params[:sort], direction: params[:direction], mode: params[:international_transportation_mode], page: params[:page], per: params[:per]})}
    else
      return render json: {errors: ["company_id is required"]}, status: 422
    end
  end
end