class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @user = current_user
    @publisher = current_user.publisher
    @reader = current_user.reader
  end

  def my_books
    if current_user.role == 'Editorial'
    publisher = current_user.publisher
    @books = publisher.books
    end
  end

  def about
  end

  def faq
  end

  def contact
  end

  def publishers
  end

  def memberships
    @memberships = Membership.all
  end

end
