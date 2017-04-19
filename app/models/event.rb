class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees
  has_many :comments
  validates :name, :city, :doe, :state, :city, presence: true
  validates :state, length: { is: 2 }
end
