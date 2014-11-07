class Portrait < ActiveRecord::Base
  belongs_to :person
  mount_uploader :img, ImgUploader
end
