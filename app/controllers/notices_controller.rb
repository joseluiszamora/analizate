class NoticesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  # GET /notices
  def index
    @notices = Notice.all
  end

  # GET /notices
  def slide
    @notices = Notice.all
  end

  # GET /notices/1
  def show
  end

  # GET /notices/new
  def new
    @notice = Notice.new
  end

  # GET /notices/1/edit
  def edit
  end

  # POST /notices
  def create
    @notice = Notice.new(notice_params)

    if @notice.save
      redirect_to notices_url, notice: 'Notice was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /notices/1
  def update
    if @notice.update(notice_params)
      redirect_to notices_url, notice: 'Notice was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /notices/1
  def destroy
    @notice.destroy
    redirect_to notices_url, notice: 'Notice was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notice
      @notice = Notice.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notice_params
      params.require(:notice).permit(:title, :description, :image)
    end
end
