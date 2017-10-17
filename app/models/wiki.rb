class Wiki < ApplicationRecord
  has_many :comments, dependent: :destroy
end
