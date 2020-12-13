class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?, only: :dashboard_admin
  
  def profil
    @user = User.find_by(id: params[:id])
  end

  def dashboard_admin
    @park = Park.all.first
    @news = News.all
    @items = Item.all
    @attractions = Attraction.all
    @avatars = Avatar.all
  end
end
