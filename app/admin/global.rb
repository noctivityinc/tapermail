ActiveAdmin.register Global do
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :taper_file, :as => :file
      f.input :taper_pro_file, :as => :file
    end
    f.buttons
  end

  controller do
    def permitted_params
      params.permit(:global => [:taper_file, :taper_pro_file])
    end
  end

end
