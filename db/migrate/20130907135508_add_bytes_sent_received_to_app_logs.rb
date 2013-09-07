class AddBytesSentReceivedToAppLogs < ActiveRecord::Migration
  def change
    add_column :app_logs, :bytes_sent, :integer, limit: 8
    add_column :app_logs, :bytes_recv, :integer, limit: 8
  end
end
