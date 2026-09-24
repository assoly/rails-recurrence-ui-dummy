class WebinarsController < ApplicationController
  before_action :set_webinar, only: %i[ show edit update destroy ]

  # GET /webinars or /webinars.json
  def index
    @webinars = Webinar.all
  end

  # GET /webinars/1 or /webinars/1.json
  def show
  end

  # GET /webinars/new
  def new
    @webinar = Webinar.new
  end

  # GET /webinars/1/edit
  def edit
  end

  # POST /webinars or /webinars.json
  def create
    @webinar = Webinar.new(webinar_params)

    respond_to do |format|
      if @webinar.save
        format.html { redirect_to @webinar, notice: "Webinar was successfully created." }
        format.json { render :show, status: :created, location: @webinar }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @webinar.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /webinars/1 or /webinars/1.json
  def update
    respond_to do |format|
      if @webinar.update(webinar_params)
        format.html { redirect_to @webinar, notice: "Webinar was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @webinar }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @webinar.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /webinars/1 or /webinars/1.json
  def destroy
    @webinar.destroy!

    respond_to do |format|
      format.html { redirect_to webinars_path, notice: "Webinar was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webinar
      @webinar = Webinar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webinar_params
      params.require(:webinar).permit(:title, :description, :starts_at, :finishes_at, :time_zone_name, :schedule_json)
    end
end
