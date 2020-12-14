class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: :dashboard_admin
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    # @subject = Subject.friendly.find(params[:id])
    # if current_user.id != @subject.user_id
    #   redirect_to subject_path
    # end
    # @categories = Category.all
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(avatar_id: params[:user][:avatar_id])
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
end
