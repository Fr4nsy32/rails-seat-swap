class Booking < ApplicationRecord
  belongs_to :job
  belongs_to :user
  VALID_STATUSES = ['pending', 'confirmed', 'cancelled', 'completed'].freeze

  # Valider que le statut est inclus dans la liste des statuts valides
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }
end
