class Post < ApplicationRecord
    searchkick
    belongs_to :user
    has_many :reviews
    
    has_attached_file :image, styles: { medium: "300x300#", thumb: "50x50#" }, default_url: ":style/Avatar_silhouette.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    validates_attachment_size :image, :less_than => 5.megabytes
end
