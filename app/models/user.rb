class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :user_book_ships
  has_many :books, through: :user_book_ships

  has_many :comments

  has_many :issue_logs

  validates :email, presence: true, if: :domain_check


  APPROVED_DOMAINS = ["junyiacademy.org","teach4taiwan.org","kistschool.org"]

  def domain_check
    unless APPROVED_DOMAINS.any? { |word| email.end_with?(word)}
      errors.add(:email, "domain only: " + APPROVED_DOMAINS.to_s)
    end
  end


  # has_many :issue_logs
  # has_many :books, through: :issue_logs

  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.balance ||= 100
  end

  def is_admin?
    self.role == "admin"

  end


  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first

    if user
      return user
    else
      registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        if registered_user[:name].blank?
          registered_user[:name] = data["name"]
        end

        if registered_user[:provider].blank?
          registered_user[:provider] = access_token.provider
        end

        if registered_user[:img_url].blank?
          registered_user[:img_url] = data["image"]
        end

        if registered_user[:uid].blank?
          registered_user[:uid] = access_token.uid
        end

        registered_user.save!

        return registered_user

      else
        if data["email"].split("@").last == "junyiacademy.org"
          user = User.create(
            name: data["name"],
            provider:access_token.provider,
            email: data["email"],
            img_url: data["image"],
            uid: access_token.uid ,
            password: Devise.friendly_token[0,20]
          )
          user.save!
        else
          return nil
        end
      end
    end
  end

end
