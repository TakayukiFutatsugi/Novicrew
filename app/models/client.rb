class Client < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :jobs, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :scouts
  has_many :rooms
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :representativeName, presence: true, length: { maximum: 50 }
  validates :industry, length: { maximum: 50 }
  validates :business, length: { maximum: 50 }
  validates :staff, length: { maximum: 50 }
  validates :engineer, length: { maximum: 50 }
  validates :address, length: { maximum: 50 }
  validates :introduction, length: { maximum: 1000 }
end

class Client::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :representativeName])
    permit(:account_update, keys: [:name, :homepage, :industry, :business, :staff, :engineer, :address, :introduction, :representativeName])
  end
end