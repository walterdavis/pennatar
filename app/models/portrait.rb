class Portrait < ActiveRecord::Base
  belongs_to :person
  mount_uploader :img, ImgUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_img
  before_destroy :clean_up_links
  
  def crop_img
    img.recreate_versions! if crop_x.present?
  end
  
  def tiny_icon
    ActionController::Base.helpers.image_tag( img.url(:thumb), class: 'tiny' )
  end
  
  private
  def clean_up_links
    self.person.update_columns(selected_portrait_id: nil) if person.selected_portrait == self
  end
end
