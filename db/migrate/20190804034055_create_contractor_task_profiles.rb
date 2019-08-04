class CreateContractorTaskProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :contractor_task_profiles do |t|
      t.references :contractor, foreign_key: true
      t.references :task_profile, foreign_key: true

      t.timestamps
    end
  end
end
