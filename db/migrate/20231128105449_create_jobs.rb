class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|

      t.text :description
      t.string :title
      t.integer :price
      t.string :location
      t.boolean :avaible, :default => true
      t.date :avaible_from
      t.integer :credit_to_earn, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
