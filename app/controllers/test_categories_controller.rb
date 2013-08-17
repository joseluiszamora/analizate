class TestCategoriesController < ApplicationController
  before_action :set_test_category, only: [:show, :edit, :update, :destroy]

  # GET /test_categories
  def index
    @test_categories = TestCategory.all
  end

  # GET /test_categories/1
  def show
  end

  # GET /test_categories/new
  def new
    @test_category = TestCategory.new
  end

  # GET /test_categories/1/edit
  def edit
  end

  # POST /test_categories
  def create
    @test_category = TestCategory.new(test_category_params)

    if @test_category.save
      redirect_to test_categories_url, notice: 'Test category was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /test_categories/1
  def update
    if @test_category.update(test_category_params)
      redirect_to test_categories_url, notice: 'Test category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /test_categories/1
  def destroy
    @test_category.destroy
    redirect_to test_categories_url, notice: 'Test category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_category
      @test_category = TestCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def test_category_params
      params.require(:test_category).permit(:description, :ancestry)
    end
end
