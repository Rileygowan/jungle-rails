class User < ActiveRecord::Base
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, presence: true, :length => {:within => 2..10}
  validates :password_confirmation, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :orders
  has_many :reviews
  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.delete(' '))
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
