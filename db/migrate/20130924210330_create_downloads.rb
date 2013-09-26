class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :email
      t.string :name
      t.string :token
      t.datetime :last_download_at
      t.integer :number_remaining, default: 5

      t.timestamps
    end
  end
end
