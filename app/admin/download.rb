ActiveAdmin.register Download do

  controller do
    def permitted_params
      params.permit(:download => [:name, :email, :number_remaining, :token])
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :email
      if f.object.new_record?
        f.input :token, hint: '(optional).  CANNOT be changed once created'
      end
      f.input :number_remaining
    end
    f.actions
  end

  index do 
    column :name do |dl|
      link_to dl.name, admin_download_path(dl)
    end
    column :email
    column :token
    column :last_download_at
    column '# remaining' do |dl|
      dl.number_remaining
    end
    default_actions
  end

  show do |dl|
    attributes_table do
      row :created_at
      row :name
      row :email
      row :download_link do
        "http://tapermail.com/dl/#{dl.token}"
      end
      row :last_download_at
      row :number_remaining
    end
  end

end
