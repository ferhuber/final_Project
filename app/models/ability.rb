class Ability
  include CanCan::Ability

  def initialize(customer)
    customer ||= Customer.new


    if customer.is_admin?
      can :manage, :all
    end

    can :manage, Product do |product|
      product.customer == customer
    end

  end
end
