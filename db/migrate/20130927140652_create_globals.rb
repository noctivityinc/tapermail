class CreateGlobals < ActiveRecord::Migration
  def change
    create_table :globals do |t|
      t.attachment :taper_file
      t.attachment :taper_pro_file

      t.timestamps
    end
  end
end
