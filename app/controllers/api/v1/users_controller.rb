class Api::V1::UsersController < ApplicationController
  respond_to :json

  def doctors
    respond_with User.medical
  end
end
