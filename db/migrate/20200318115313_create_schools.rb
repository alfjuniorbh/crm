class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :email
      t.string :website
      t.string :phone
      t.string :logo
      t.string :is_active

      t.timestamps
    end
  end
end
