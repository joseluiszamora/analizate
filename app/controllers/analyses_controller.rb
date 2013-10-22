class AnalysesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_analysis, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :js

  # GET /analyses
  def index
    # sort = "#{params[:sort]} #{params[:direction]}"
    # q = Analysis.search({:patient_name => params[:q]})
    # @analyses = q.result.order(sort).page(params[:page]).per(10)
    # respond_with @analyses


    if current_user.is_admin?
      @analyses = Analysis.all
    else
      @analyses = current_user.analyses
    end
  end


  # GET /analyses/1
  def show
    @categories = @analysis.categories.includes(:tests)
    @parents = @categories.map { |c| c.parent }.uniq

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => @analysis.patient_full_name,
          :template => 'analyses/show.pdf.haml',
          :disposition => 'attachment',
          :layout => 'pdf.html.haml',
          :show_as_html => params[:debug].present?,
          :orientation => 'Portrait',
          :font_size   => '12px',
          :page_size => 'Letter',
          :margin => {:top => 60,
            :bottom => 10,
            :left => 25,
            :right => 10},
          :encoding => 'utf-8',
          :header => {:html => { :template => 'analyses/header.pdf.haml',
            :locals   => { :analysis => @analysis }},
            :font_name  => 'Arial',
            :spacing  => 20},
          :footer => {:html => { :template => 'analyses/footer.pdf.haml',
            :locals   => { :analysis => @analysis }},
            :font_name          => 'Arial'}
      end
    end
  end

  # GET /analyses/new
  def new
    @analysis = Analysis.new(receipt_date: Date.today, delivery_date: Date.today)
    @parents = []
  end

  # GET /analyses/1/edit
  def edit
    @parents = @analysis.categories.map { |c| c.parent }.uniq
  end

  # POST /analyses
  def create
    @analysis = Analysis.new(analysis_params)

    if @analysis.save
      redirect_to @analysis, notice: 'Analysis was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /analyses/1
  def update
    if @analysis.update(analysis_params)
      redirect_to @analysis, notice: 'Analysis was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /analyses/1
  def destroy
    @analysis.destroy
    redirect_to analyses_url, notice: 'Analysis was successfully destroyed.'
  end

  def patients
    @patients = User.patients.search_by_params(params[:q])
    respond_with @patients, each_serializer: PatientSerializer
  end

  def medical
    @medical = User.medical.search_by_params(params[:q])
    respond_with @medical, each_serializer: PatientSerializer
  end

  def tests
    @analysis = Analysis.find(params[:id]) rescue nil
    @categories = TestCategory.find(params[:category_ids]) rescue []
    @parents = @categories.map { |c| c.parent }.uniq
    @test_ids = params[:test_ids].map { |e| e.to_i }
    respond_with do |format|
      format.js
    end
  end

  def categories
    @analysis = Analysis.find(params[:analysis_id]) rescue nil
    @category = TestCategory.includes(:tests).find(params[:id]) rescue nil
    respond_with do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_analysis
      @analysis = Analysis.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def analysis_params
      params.require(:analysis).permit(:patient_id, :patient_type_selector, :patient_name, :doctor_id, :receipt_date, :delivery_date, :receipt_time, :delivery_time, { laboratories_attributes: [:id, :result, :test_id, :desc, :image] })
    end
end
