class RemoveLocationFromJobs < ActiveRecord::Migration[7.1]
  def change
    remove_column :jobs, :location, :string
  end
end
