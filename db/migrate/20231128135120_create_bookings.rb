class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.string :status
      t.date :start_date
      t.date :end_date
      t.integer :listing_id
      t.integer :user_id
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
