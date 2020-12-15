class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: [:dashboard_admin, :add_participant]
  
  def show
    @user = User.friendly.find_by(id: params[:id])
    @avatars = Avatar.all
  end

  def edit
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(avatar_id: params[:avatar_id])
      # flash[:success] = "Votre ressource a bien été modifiée !"
      redirect_to user_path(@user.id)
    else
      # flash.now[:alert] = "Attention votre ressource n'a pas pû être modifiée. Il doit manquer le titre, le contenu, la difficulté ou la catégorie !"
      render :edit
    end  
  end

  def dashboard_admin
    @park = Park.all.first
    @news = News.all
    @items = Item.all
    @attractions = Attraction.all
    @avatars = Avatar.all
  end

  def add_participant
    if @user = User.find_by(identifiant: params[:identifiant])
      @user.update(xp: cumulate_xp(@user.xp, params[:xp]))
    else
      flash.now[:alert] = "Attention l'identifiant entré n'existe pas!"
      redirect_to users_dashboard_admin_path
    end
  end

  private 

  def cumulate_xp(old_xp, xp_received)
    old_xp += xp_received.to_i
  end
end


