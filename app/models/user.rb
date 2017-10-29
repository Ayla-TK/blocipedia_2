class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :wikis
  after_initialize :set_default_role, :if => :new_record?


  def going_public
      self.wikis.each { |wiki| puts wiki.publicize }
  end

  def set_default_role
   self.role ||= :standard
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:standard, :premium, :admin]
end
