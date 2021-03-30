class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :menu_lists, dependent: :destroy
  has_many :families, dependent: :destroy

  def self.guest
    find_or_create_by!(name: 'Guest', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

end
