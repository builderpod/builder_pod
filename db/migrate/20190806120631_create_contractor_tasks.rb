class CreateContractorTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_tasks do |t|
      t.references :contractor, foreign_key: true
      t.references :task, foreign_key: true
      t.date :start
      t.date :end
      t.decimal :amount
      t.string :status

      t.timestamps
    end
  end
end
