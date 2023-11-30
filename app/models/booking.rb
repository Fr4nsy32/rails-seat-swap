class Booking < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :reviews
  enum :status, { pending: 0, booked: 1, cencelled: 2, completed: 3 }
  # VALID_STATUSES = ['available', 'pending', 'booked', 'cancelled', 'completed'].freeze

  # # Valider que le statut est inclus dans la liste des statuts valides
  # validates :status, presence: true, inclusion: { in: VALID_STATUSES }
end
