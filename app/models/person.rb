class Person < ActiveRecord::Base
  has_many :portraits
  belongs_to :selected_portrait, class_name: 'Portrait'
  before_create :set_photo_key
  
  private
  def set_photo_key
    self.photo_key = "#{last_name.downcase.slice(0,4)}#{pennid.to_s.slice(0,4)}"
  end
end
