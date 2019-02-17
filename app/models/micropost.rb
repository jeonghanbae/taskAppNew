class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length: { maximum: 10 }
  validates :status, presence: true, length: { maximum: 255 }
  has_many :comments, dependent: :destroy
  validate  :picture_size
  
  private
  # アップロード画像のサイズを検証する
  def picture_size
    if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
    end
  end
  
end