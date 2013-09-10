class AnalysesController < ApplicationController
  before_action :set_analysis, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :js

  # GET /analyses
  def index
    @analyses = Analysis.all
  end

  # GET /analyses/1
  def show
    @categories = @analysis.categories.includes(:tests)

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => @analysis.patient_full_name,
          :template => 'analyses/show.pdf.haml',
          :disposition => 'attachment',
          :show_as_html => params[:debug].present?,
          :orientation => 'Portrait',
          :font_size   => 12px,
          :page_size => 'letter',
          :encoding => 'utf-8',
          :no_background => true,
          :margin => {:top => 180px,
            :bottom => 100px,
            :left => 40px,
            :right => 20px},
            :font_size => 12px,
          :footer => {:html => { :template => 'analyses/pdf_footer.html.haml'},
            :font_size => 10px,
            :left => 30px}
      end
    end
  end

  # GET /analyses/new
  def new
    @analysis = Analysis.new
  end

  # GET /analyses/1/edit
  def edit
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
    @categories = TestCategory.find(params[:category_ids])
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
      params.require(:analysis).permit(:patient_id, :doctor_id, :receipt_date, :delivery_date, :receipt_time, :delivery_time, { laboratories_attributes: [:id, :result, :test_id] })
    end
end
