class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_admin?, only: [:new, :create, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    # @user = User.find_by(slug: params[:user_id])
    # if @user.profile_pic.attached?
      # @user.profile_pic.purge
      # if params[:profile_pic]
        # @user.profile_pic.attach(params[:profile_pic])
        # flash[:success] = "Vous avez changé votre photo de profil !"
      # end
      # flash[:success] = "Vous avez supprimé votre photo de profil !"
      # redirect_to(user_path(@user))
    # else
      # @user.profile_pic.attach(params[:profile_pic])
      # flash[:success] = "Vous avez changé votre photo de profil !"
      # redirect_to(user_path(@user))
    # end

    @item = Item.new(item_params)
    


      puts "^" * 50
      # @item.picture.attach(params[:picture])
      @item.picture.attach(io: File.open('app/assets/images/favicon.png'), filename: 'favicon.png', content_type: 'image/png')
      puts @item.picture.attached?
      puts "^" * 50

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :unit_price_ht, :unit_price_tva, :unit_price_ttc, :tva)
    end
end