class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :cpf, presence: true, :cpf => true
  validates_uniqueness_of :email, :cpf


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "photo-default.png" 
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

end
