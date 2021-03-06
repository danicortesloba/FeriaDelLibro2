class MembershipOrdersController < ApplicationController
  load_resource :except => [:create]
  authorize_resource

  # GET /membership_orders
  # GET /membership_orders.json
  def index
      @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
      @books = Book.all
      @membership_orders = current_user.membership_orders.cart
      @publisher = current_user.publisher
      precios = @membership_orders.map do |order|
            order.membership.price
      end
      @total = precios.sum
  end

  # GET /membership_orders/1
  # GET /membership_orders/1.json
  def show
  end

  # GET /membership_orders/new
  def new
    @membership_order = MembershipOrder.new
  end

  # GET /membership_orders/1/edit
  def edit
  end

  # POST /membership_orders
  # POST /membership_orders.json
  def create
    @membership = Membership.find(params[:membership_id])
    @membership_order = MembershipOrder.new(membership: @membership, user: current_user)

    respond_to do |format|
      if @membership_order.save
        format.html { redirect_to membership_orders_path, notice: 'Se agregó la membresía a tu carrito.' }
        format.json { render :show, status: :created, location: @membership_order }
      else
        format.html { render :new }
        format.json { render json: @membership_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /membership_orders/1
  # PATCH/PUT /membership_orders/1.json
  def update
    respond_to do |format|
      if @membership_order.update(membership_order_params)
        format.html { redirect_to @membership_order, notice: 'Se actualizó tu carrito.' }
        format.json { render :show, status: :ok, location: @membership_order }
      else
        format.html { render :edit }
        format.json { render json: @membership_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /membership_orders/1
  # DELETE /membership_orders/1.json
  def destroy
    @membership_order.destroy
    respond_to do |format|
      format.html { redirect_to membership_orders_url, notice: 'Se eliminó la membresía de tu carrito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership_order
      @membership_order = MembershipOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_order_params
      params.require(:membership_order).permit(:membership_id, :user_id, :paid, :milling)
    end
end
