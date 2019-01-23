class UsersController < ApplicationController
  authorize_resource :class => false
  def profile
    @user = current_user
    @publisher = current_user.publisher
    @reader = current_user.reader
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
    @books = Book.all
    @addresses = current_user.addresses
    @bankaccount = current_user.bankaccounts.last
  end

  def my_books
    if current_user.role == 'Editorial'
    publisher = current_user.publisher
    @books = publisher.books.page(params[:page]).per(8)
    end
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
  end

  def my_sales
    @morders = Order.joins(:book).where(:books => { :publisher => current_user.publisher })
    @orders = @morders.where(payed: true)
    @orders.each do |order|
      @expiration = (order.billing.created_at + 20.day).to_date.strftime("%d/%m/%Y")
      @addresses= order.user.addresses.where(default: true)
    end
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
    @bankaccount = current_user.bankaccounts.last

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
    @publishers = Publisher.page(params[:page]).per(10)
  end

  def memberships
    @memberships = Membership.all
  end

end
