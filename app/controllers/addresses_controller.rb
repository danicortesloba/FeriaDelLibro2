class AddressesController < ApplicationController
  load_and_authorize_resource


  # GET /addresses
  # GET /addresses.json

  def default
  @default = Address.where(default: true).where(user: current_user)
  @default.update(default: false)



  @address = Address.find(params[:id])
  @address.update(default: true)


   redirect_to addresses_path
  end

  def index
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
    @books = Book.all
    @addresses = current_user.addresses
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show

  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    if current_user.role =="Editorial"

      respond_to do |format|
        if @address.save
          format.html { redirect_to memberships_path, notice: 'La dirección se creó correctamente.' }
          format.json { render :show, status: :created, location: @address }
        else
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @address.save
          format.html { redirect_to addresses_path, notice: 'La dirección se creó correctamente.' }
          format.json { render :show, status: :created, location: @address }
        else
          format.html { render :new }
          format.json { render json: @address.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to addresses_path, notice: 'La dirección se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'La dirección se eliminó.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.


    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:address).permit(:user_id, :title, :address, :default, :commune, :region)
    end
end
