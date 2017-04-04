class Ability
  include CanCan::Ability

    def initialize(user)

      user ||= User.new

      if user.is_admin?
        can :manage, :all
      end

      can :manage, Auction do |a|
        a.user == user
      end

        can :manage, Bid do |b|
          b.user == user || b.a.user == user
      end



  end
end
