class CreateGreylists < ActiveRecord::Migration
  def change
    create_table :greylists do |t|
      t.string :email
      t.string :name
      t.string :submitted_by

      t.timestamps
    end
  end
end
