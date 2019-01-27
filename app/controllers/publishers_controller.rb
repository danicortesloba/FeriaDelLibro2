class PublishersController < ApplicationController
  load_and_authorize_resource
  before_action :set_publisher, only: [:add_publisher_comment, :remove_publisher_comment]

  # GET /publishers
  # GET /publishers.json
  def index
    @publishers = Publisher.page(params[:page]).per(24)
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
    @books = Book.all
  end
  # GET /publishers/1
  # GET /publishers/1.json
  def show
    @pbooks = @publisher.books.page(params[:page]).per(5)
    @publishers = Publisher.all
    @bycomments = Book.joins(:comments).group("books.id").order("count(books.id)DESC")
    @books = Book.all
    @facebookurl = "https://" + @publisher.facebook
  end

  # GET /publishers/new
  def new
    @publisher = Publisher.new
    @user = current_user
  end

  # GET /publishers/1/edit
  def edit
  end

  def add_publisher_comment
    publishercomment = PublisherComment.new
    publishercomment.content = params[:content]
    publishercomment.user_id = current_user.id
    publishercomment.publisher_id = @publisher.id
    publishercomment.save
    @publisher.publisher_comments << publishercomment
    redirect_to publisher_path
  end

  def remove_publisher_comment
    publisher_comment = @publisher.publisher_comments.find(params[:publisher_comment_id])
    if publisher_comment.user == current_user
      @publisher.publisher_comments.delete(publisher_comment)
    end
    redirect_to publisher_path
  end

  # POST /publishers
  # POST /publishers.json
  def create
    @publisher = Publisher.new(publisher_params)

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to new_address_path, notice: 'La editorial se creó correctamente.' }
        format.json { render :show, status: :created, location: @publisher }
      else
        format.html { render :new }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publishers/1
  # PATCH/PUT /publishers/1.json
  def update
    respond_to do |format|
      if @publisher.update(publisher_params)
        format.html { redirect_to books_path, notice: 'La editorial se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @publisher }
      else
        format.html { render :edit }
        format.json { render json: @publisher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publishers/1
  # DELETE /publishers/1.json
  def destroy
    @publisher.destroy
    respond_to do |format|
      format.html { redirect_to publishers_url, notice: 'La editorial se eliminó.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher
      @publisher = Publisher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publisher_params
      params.require(:publisher).permit(:name, :rut, :giro, :user_id, :id, :voucher, :method, :address, :facebook, :twitter, :instagram, :website, :razon)
    end
end
