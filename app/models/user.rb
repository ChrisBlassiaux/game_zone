class User < ApplicationRecord
  # validates :nickname, uniqueness: true, presence: true, length: {maximum: 30}
  # validates :password, presence: true,
  #                      confirmation: true,
  #                      length: {within: 6..40},
  #                      on: :create
  # validates :password, confirmation: true,
  #                      length: {within: 6..40},
  #                      allow_blank: true,
  #                      on: :update
  # validates :description, length: {maximum: 350}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
