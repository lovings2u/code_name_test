class Stage < ApplicationRecord
  belongs_to :theme
  has_many :hints
  has_many :images
  has_secure_password
end
