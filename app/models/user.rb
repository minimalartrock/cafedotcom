# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_one_attached :avatar
  has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :shops, through: :favorites, dependent: :destroy
	# has_many :congestions
	# has_many :shops, through: :congestions

  validates :name, presence: true, length: { maximum: 50 }

	scope :desc, -> () { order(created_at: :desc) }
	scope :users, -> () { where(admin: false) }
	scope :administrators, -> () { where(admin: true) }

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def self.find_for_oauth(auth)
    user ||= User.create(
      uid: auth.uid,
      provider: auth.provider,
      email: User.dummy_email(auth),
      password: Devise.friendly_token[0, 20],
      name: auth.info.name
    )

    user
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = 'ゲストユーザー'
      user.password = SecureRandom.urlsafe_base64
    end
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
