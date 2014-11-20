class User < ActiveRecord::Base
  validates :name, presence: true
  validates :cpf, presence: true
end
