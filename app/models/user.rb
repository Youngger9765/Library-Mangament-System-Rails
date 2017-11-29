class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :books
  after_initialize :set_defaults, unless: :persisted?
  def set_defaults
    self.balance ||= 100
  end
end
