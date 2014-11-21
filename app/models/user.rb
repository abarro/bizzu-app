class User < ActiveRecord::Base
  validates :name, presence: true
  validates :cpf, presence: true, :cpf => true

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "photo-default.png" 
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
