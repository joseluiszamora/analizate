class Api::V1::ServicesController < ApplicationController
  respond_to :json

  def index
    respond_with Service.where(nil)
  end
end
