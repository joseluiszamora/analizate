class AnalyzesController < ApplicationController
  respond_to :html, :json

  def index
  end

  def patients
    @patients = User.patients.search_by_params(params[:q])
    respond_with @patients, each_serializer: PatientSerializer
  end

  def medical
    @medical = User.medical.search_by_params(params[:q])
    respond_with @medical, each_serializer: PatientSerializer
  end
end
