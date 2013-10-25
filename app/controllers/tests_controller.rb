class TestsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /tests
  def index
    @tests = Test.all
  end

  # GET /tests/1
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to tests_url, notice: 'Test fue creado correctamente.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /tests/1
  def update
    if @test.update(test_params)
      redirect_to tests_url, notice: 'Test fue actualizado correctamente.'
    else
      render action: 'edit'
    end
  end

  # DELETE /tests/1
  def destroy
    @test.destroy
    redirect_to tests_url, notice: 'Test fue eliminado.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test
      @test = Test.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_params
      params.require(:test).permit(:parameter, :unit, :reference_values, :test_type, :description, :image, :test_category_id)
    end
end
