class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :collaborators
  has_many :wikis, dependent: :destroy


  after_initialize :initialize_role


  def self.going_public(user)
    @wikis = user.wikis.where(private: true)
    @wikis.each do |wiki|
      wiki.update_attribute(:private, false)
    end
  end

  private

  def initialize_role
    self.role ||= :standard
  end




  enum role: [:standard, :premium, :admin]
end
