class Booking < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :reviews
  enum :status, { pending: 0, booked: 1, cancelled: 2, completed: 3 }
  validates :start_date, :end_date, presence: true
end
