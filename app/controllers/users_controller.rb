class UsersController < ApplicationController
  before_action :authenticate_user!
  def profile
    @user = current_user
    @publisher = current_user.publisher
    @reader = current_user.reader
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
    @books = Book.all
    @addresses = current_user.addresses
  end

  def my_books
    if current_user.role == 'Editorial'
    publisher = current_user.publisher
    @books = publisher.books.paginate(:page => params[:page], :per_page => 8)
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
    end
  end

  def about
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
  end

  def faq
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
  end

  def contact
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
  end

  def publishers
    @millings = Milling.all
    @publishers = Publisher.paginate(:page => params[:page], :per_page => 10)
  end

  def memberships
    @memberships = Membership.all
  end

end
