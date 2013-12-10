class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can [:read], Article, ["published_at < ?", Time.zone.now] do |article|
      if article.published_at.present?
        article.published_at < Time.zone.now
      end
    end

    if user.is?(:administrator)
      can :manage, :all
    end
  end

end
