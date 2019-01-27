class OrdersController < ApplicationController
  load_resource :except => [:create]
  authorize_resource

  # GET /orders
  # GET /orders.json
  def index
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
    @books = Book.all
    @reader = current_user.reader
    @orders = current_user.orders.cart
    @orders.each do |order|
      @publisher_address = order.book.publisher.user.addresses.last
    end
    precios = @orders.map do |order|
    order.book.price
    end
    @total = precios.sum
    @addresses = current_user.addresses.where(default:true).each do |a|
          @adr =  a.address
          @com = a.commune
          @reg = a.region
    end
  end

  def delivery
    @order = Order.find(params[:id])
    @order.update(delivery: true)
    redirect_to orders_path
  end

  def pickup
    @order = Order.find(params[:id])
    @order.update(delivery: false)
    redirect_to orders_path
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @book = Book.find(params[:book_id])
    @order = Order.new(book: @book, user: current_user)
      if @order.save
        redirect_to books_path, notice: 'Se agregó este libro a tu carrito de compras'
      else
        redirect_to books_path, alert: 'No pudimos agregar el libro a tu carrito de compras'
      end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Se actualizó tu carrito' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Se eliminó el libro de tu carrito de compras.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:user_id, :book_id, :payed, :billing, :delivery)
    end
end
