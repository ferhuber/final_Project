ActiveAdmin.register Production do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

    form(html: {multipart: true}) do |f|
    f.inputs "Attributes" do
      f.input :quantity
    end

    f.inputs "Relationships" do
      f.input :events, as: :select, collection: Event.all.map{|event| [event.type_of, event.id]}
    end

  end

end
