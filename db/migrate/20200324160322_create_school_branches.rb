class CreateSchoolBranches < ActiveRecord::Migration[6.0]
  def change
    create_table :school_branches do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :phone
      t.string :logo
      t.string :is_active
      t.references :school, null: false, foreign_key: true

      t.timestamps
    end
  end
end
