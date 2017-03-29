ActiveAdmin.register Customer do


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



  permit_params do
    [:first_name,
     :last_name,
     :email,
     :phone,
     :password_digest,
     :address,
     :is_admin,
     :reset_digest,
     :reset_sent_at,
     :activation_digest,
     :activated,
     :activated_at,
    :remember_digest]
   end
end
