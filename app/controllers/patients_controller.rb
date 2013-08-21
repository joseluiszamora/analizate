class PatientsController < ApplicationController
  respond_to :html, :json

  def index
    respond_with get_patients
  end

  private

  def get_patients
    [{ name: 'fapencio martinez' }, { name: 'trolencio lopez' }, { name: 'tontencia perez' }]
  end
end
