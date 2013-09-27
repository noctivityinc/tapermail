class CreateAppVersions < ActiveRecord::Migration
  def change
    create_table :app_versions do |t|
      t.attachment :version_file
      t.text :change_log
      t.string :version_type
      t.string :version_number
      t.boolean :active

      t.timestamps
    end
  end
end
