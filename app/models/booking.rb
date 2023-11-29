class Booking < ApplicationRecord
  belongs_to :job
  belongs_to :user
  has_many :reviews
  VALID_STATUSES = ['available', 'pending', 'booked', 'cancelled', 'completed'].freeze

  # Valider que le statut est inclus dans la liste des statuts valides
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }
end
