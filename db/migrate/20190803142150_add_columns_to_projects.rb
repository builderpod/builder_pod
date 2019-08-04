class AddColumnsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_reference :projects, :user, foreign_key: true
    add_column :projects, :locality, :text
    add_column :projects, :region, :text
    add_column :projects, :postal_code, :text
    add_column :projects, :longitude, :float
    add_column :projects, :latitude, :float
    add_column :projects, :street_address, :text
  end
end
