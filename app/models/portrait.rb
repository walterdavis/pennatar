class Portrait < ActiveRecord::Base
  belongs_to :person
  mount_uploader :img, ImgUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_img
  
  def crop_img
    img.recreate_versions! if crop_x.present?
  end
  
  def tiny_icon
    ActionController::Base.helpers.image_tag( img.url(:thumb), class: 'tiny' )
  end
end
