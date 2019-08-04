class CreateContractors < ActiveRecord::Migration[5.2]
  def change
    create_table :contractors do |t|
      t.integer :haid
      t.string :name
      t.string :website
      t.text :description
      t.float :rating
      t.integer :review_count
      t.string :telephone
      t.string :street_address
      t.string :locality
      t.string :region
      t.string :postal_code
      t.references :user, foreign_key: true
      t.float :longitude
      t.float :latitude
      t.string :email

      t.timestamps
    end
  end
end
