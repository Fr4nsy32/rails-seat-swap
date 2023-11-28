class Job < ApplicationRecord
  validates :title,:description, presence: true
  validates :price, :credit_to_earn, presence: true, numericality: { greater_than: 0 }
  validates :location, presence: true
  # validates :avaible_from, presence: true
end
