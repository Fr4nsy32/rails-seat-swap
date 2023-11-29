class Job < ApplicationRecord
  validates :title,:description, presence: true
  validates :price, :credit_to_earn, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true
  belongs_to :user
  has_many :bookings
  # validates :avaible_from, presence: true
end
