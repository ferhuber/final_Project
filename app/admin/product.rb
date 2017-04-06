ActiveAdmin.register Product do

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
      f.input :title
      f.input :description
      f.input :calories
      f.input :image
    end

    f.inputs "Relationships" do
      f.input :types, as: :select, collection: Type.all.map{|type| [type.type_of, type.id]}
    end

    f.inputs "Relationships" do
      f.input :flavours, as: :select, collection: Flavour.all.map{|flavour| [flavour.flavour, flavour.id]}
    end

    # f.inputs "Relationships" do
    #   f.input :productions, as: :select, collection: Production.all.map{|production| [production.quantity, production.id]}
    # end

    f.actions
  end



end
