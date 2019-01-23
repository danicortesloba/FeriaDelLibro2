class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
     user ||= User.new # guest user (not logged in)
      if user.admin?
        can :manage, :all

      elsif user.role == 'Lector'
        can [:read, :add_comment], Book
        can :remove_comment, Book
        can :read, Genre
        can :create, Reader
        can :read, Membership
        can [:read, :add_publisher_comment], Publisher
        can [:read, :update], Reader, user_id: user.id
        can :create, Address
        can [:read, :update, :destroy, :default], Address, user_id: user.id
        can :create, Order
        can [:read, :update, :destroy, :delivery, :pickup], Order, user_id: user.id
        can :manage, Billing, user_id: user.id
        can [:read, :create], Comment
        can [:update, :destroy], Comment, user_id: user.id
        can [:read, :create], PublisherComment
        can :remove_publisher_comment, Publisher
        can [:update, :destroy], PublisherComment, user_id: user.id
        can [:faq, :contact, :about, :profile], :user

      elsif user.role == 'Editorial'
        can :read, Membership
        can :read, Comment
        can :read, PublisherComment
        can :create, Publisher
        can :read, Publisher
        can [:update], Publisher, user_id: user.id
        can [:create, :read], Book
        can [:update, :destroy], Book, publisher: user.publisher
        can :create, MembershipOrder
        can [:read, :update, :destroy], MembershipOrder, user_id: user.id
        can :manage, Milling, user_id: user.id
        can [:add_genre, :remove_genre], Book, publisher: user.publisher
        can [:create, :read], Genre
        can [:update, :destroy], Genre, publisher: user.publisher
        can [:faq, :contact, :about, :profile, :my_books, :my_sales], :user
        can [:read, :create], Address
        can [:update, :destroy, :default], Address, user_id: user.id
        can :create, Bankaccount
        can [:read, :update, :destroy], Bankaccount, user_id: user.id
      else
        can :read, [Book, Comment, Genre, Membership, PublisherComment, Publisher]
        can [:faq, :contact, :about], :user
      end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
