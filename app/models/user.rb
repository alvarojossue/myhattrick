class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_voter
  belongs_to :team

  mount_uploader :avatar, AvatarUploader

 validates :name, :email, :password, :avatar, :team, presence: true
 validates :name, :email, uniqueness: true
  
end
