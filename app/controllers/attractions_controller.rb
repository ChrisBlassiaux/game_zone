class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_admin?, only: [:new, :create, :edit, :update, :destroy]

  # GET /attractions
  # GET /attractions.json
  def index
    @attractions = Attraction.all
  end

  # GET /attractions/1
  # GET /attractions/1.json
  def show
  end 

  # GET /attractions/new
  def new
    @attraction = Attraction.new
  end

  # GET /attractions/1/edit
  def edit
  end

  # POST /attractions
  # POST /attractions.json
  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.park_id = Park.all.first.id


    respond_to do |format|
      if @attraction.save
        format.html { redirect_to @attraction, notice: 'Attraction was successfully created.' }
        format.json { render :show, status: :created, location: @attraction }
      else
        format.html { render :new }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attractions/1
  # PATCH/PUT /attractions/1.json
  def update
    respond_to do |format|
      if @attraction.update(attraction_params)
        format.html { redirect_to @attraction, notice: 'Attraction was successfully updated.' }
        format.json { render :show, status: :ok, location: @attraction }
      else
        format.html { render :edit }
        format.json { render json: @attraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attractions/1
  # DELETE /attractions/1.json
  def destroy
    @attraction.destroy
    respond_to do |format|
      format.html { redirect_to attractions_url, notice: 'Attraction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attraction
      @attraction = Attraction.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attraction_params
      params.require(:attraction).permit(:name, :experience_points, :maximum_size, :description, :video_presentation, :park_id, pictures: [])
    end
end
