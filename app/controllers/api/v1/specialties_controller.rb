class Api::V1::SpecialtiesController < ApplicationController
  respond_to :json

  def index
    respond_with Specialty.where(nil)
  end
end
