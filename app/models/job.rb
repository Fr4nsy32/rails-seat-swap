class Job < ApplicationRecord
  validates :title,:description, presence: true
  validates :price, :credit_to_earn, presence: true, numericality: { greater_than: 0 }
  validates :address, presence: true
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_one_attached :photo
  has_one_attached :image
  attribute :location, :string unless column_names.include?('location')
  # validates :avaible_from, presence: true
end

# <%# <%= link_to "Edit", edit_job_path %>
#    <%# <%= link_to "delete", job_path(@job), %>
#     <%# data: {turbo_method: :delete, turbo_confirm: "Are you sure?"} %>
