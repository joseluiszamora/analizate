class Api::V1::InstitutionsController < ApplicationController
  respond_to :json

  def index
    respond_with Institution.where(nil)
  end
end
