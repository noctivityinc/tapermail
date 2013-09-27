ActiveAdmin.register AppVersion do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :version_file, :as => :file
      f.input :active, hint: 'activating this version will deactivate previous versions of the same type'
      f.input :version_type, as: :select, collection: ['standard','pro']
      f.input :version_number
      f.input :change_log
    end
    f.buttons
  end

  show do |av|
    attributes_table do
      row :version_file_file_name
      row :version_file_updated_at
      row 'download link' do
        link_to av.version_file.url, av.version_file.url
      end
      row :active
      row :version_type
      row :version_number
      row :change_log
    end
  end

  controller do
    def permitted_params
      params.permit(:app_version => [:version_file, :active, :version_type, :version_number, :change_log])
    end
  end
end
