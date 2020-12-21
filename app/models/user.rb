class User < ApplicationRecord
  extend FriendlyId
  friendly_id :identifiant, use: :slugged
  
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true,
                       confirmation: true,
                       length: {within: 6..40},
                       on: :create
  validates :password, confirmation: true,
                       length: {within: 6..40},
                       allow_blank: true,
                       on: :update
  validates :identifiant, presence: true, uniqueness: true
  validates :xp, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
