class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.references :task, foreign_key: true
      t.references :contractor, foreign_key: true
      t.decimal :amount
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
