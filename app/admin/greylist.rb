ActiveAdmin.register Greylist do

  controller do
    def permitted_params
      params.permit(:greylist => [:name, :email, :submitted_by])
    end
  end

end
