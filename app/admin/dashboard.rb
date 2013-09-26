ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Downloads" do
          ul do
            Download.order('last_download_at').limit(10).map do |dl|
              li dl.name
            end
          end
        end
      end

      column do
        panel "Usage" do
          para "Number of Active Users: #{AppLog.distinct('uuid').where('updated_at > ?',24.hours.ago).count}"
          para "Total Users Last 30 Days: #{AppLog.distinct('uuid').where('updated_at > ?',30.days.ago).count}"
          para "Bytes Sent Last 30 Days: #{AppLog.where('updated_at > ?',30.days.ago).sum('bytes_sent')}"
          para "Bytes Received Last 30 Days: #{AppLog.where('updated_at > ?',30.days.ago).sum('bytes_recv')}"
        end
      end

      column do
        panel "Top Domains Monitored" do
          ul do
            AppLog.where('updated_at > ?',30.days.ago).select("count(email_domain) as cnt, email_domain").group('email_domain').order('count(email_domain) desc').limit(10).map do |dl|
              li "#{dl.email_domain}: #{dl.cnt}"
            end
          end
        end
      end
    end
  end # content
end
