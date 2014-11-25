class User < ActiveRecord::Base

  has_secure_password
  before_save :encrypt_password
  attr_accessor :password_salt, :password_hash

  validates :password, confirmation: true
  validates :password, presence: true, :on => :create
  validates :name, presence: true
  validates :email, presence: true
  validates :cpf, presence: true, :cpf => true
  validates_uniqueness_of :email, :cpf


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "photo-default.png" 
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
