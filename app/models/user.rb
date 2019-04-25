class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :reviews, dependent: :destroy
    
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "50x50#" }, default_url: ":style/Avatar_silhouette.jpg"
    
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def create_default_url
   ActionController::Base.helpers.asset_path("images/Avatar_silhouette.jpg", :digest => false)
  end

end
