class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many:post_images,dependent: :destroy
  has_one_attached:profile_image
  
  def get_profile_image(size)
    unless profile_image_attached?
      file_path=Rails.root.join('app/assets/images/sample-author1.jpg')
      profile_image_attach(io: File.open(file_path),filename: 'default-image.png',content_type: 'image/png')
    end
    profile_image.variant(resize: size).processed
  end
end