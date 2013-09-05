class CreateAppLogs < ActiveRecord::Migration
  def change
    create_table :app_logs do |t|
      t.string :uuid, :null => false
      t.string :email_domain, :null => false

      t.timestamps
    end
  end
end
