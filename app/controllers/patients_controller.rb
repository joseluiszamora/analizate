class PatientsController < ApplicationController
  respond_to :html, :json

  def index
    @patients = User.patients.search_by_params(params[:q])
    respond_with @patients, each_serializer: PatientSerializer
  end
end
