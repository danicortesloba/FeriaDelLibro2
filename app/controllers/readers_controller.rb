class ReadersController < ApplicationController
load_and_authorize_resource

  # GET /readers
  # GET /readers.json
  def index
    @readers = Reader.page(params[:page]).per(30)
  end

  # GET /readers/1
  # GET /readers/1.json
  def show
  end

  # GET /readers/new
  def new
    @reader = Reader.new
    @user = current_user
  end

  # GET /readers/1/edit
  def edit
  end

  # POST /readers
  # POST /readers.json
  def create
    @reader = Reader.new(reader_params)

    respond_to do |format|
      if @reader.save
        EmailMailer.welcome_reader(@reader).deliver_later

        format.html { redirect_to books_path, notice: 'El lector se creó correctamente' }
        format.json { render :show, status: :created, location: @reader }
      else
        format.html { render :new }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readers/1
  # PATCH/PUT /readers/1.json
  def update
    respond_to do |format|
      if @reader.update(reader_params)
        format.html { redirect_to books_path, notice: 'El lector se actualizó correctamente' }
        format.json { render :show, status: :ok, location: @reader }
      else
        format.html { render :edit }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readers/1
  # DELETE /readers/1.json
  def destroy
    @reader.destroy
    respond_to do |format|
      format.html { redirect_to readers_url, notice: 'El lector se eliminó' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reader
      @reader = Reader.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reader_params
      params.require(:reader).permit(:firstname, :lastname, :user_id, :id)
    end
end
