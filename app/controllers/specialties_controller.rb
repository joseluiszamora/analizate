class SpecialtiesController < ApplicationController
  before_action :set_specialty, only: [:show, :edit, :update, :destroy]

  # GET /specialties
  def index
    @specialties = Specialty.all
  end

  # GET /specialties/1
  def show
  end

  # GET /specialties/new
  def new
    @specialty = Specialty.new
  end

  # GET /specialties/1/edit
  def edit
  end

  # POST /specialties
  def create
    @specialty = Specialty.new(specialty_params)

    if @specialty.save
      redirect_to specialties_path, notice: 'Specialty was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /specialties/1
  def update
    if @specialty.update(specialty_params)
      redirect_to specialties_path, notice: 'Specialty was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /specialties/1
  def destroy
    @specialty.destroy
    redirect_to specialties_url, notice: 'Specialty was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialty
      @specialty = Specialty.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def specialty_params
      params.require(:specialty).permit(:name, :desc)
    end
end
