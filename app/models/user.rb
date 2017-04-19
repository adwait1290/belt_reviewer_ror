class User < ActiveRecord::Base
  has_secure_password
  has_many :comments
  has_many :events
  has_many :attendees, dependent: :destroy
  has_many :events_attended, through: :attendees, source: :events
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name,:last_name, :state, :city, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :state, length: { is: 2}
  
  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end
end
