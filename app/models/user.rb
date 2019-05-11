class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :user_book_ships
  has_many :books, through: :user_book_ships

  has_many :posts

  # has_many :issue_logs
  # has_many :books, through: :issue_logs

  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.balance ||= 100
  end

  def is_admin?
    self.role == "admin"

  end
end
