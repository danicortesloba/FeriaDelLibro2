class PublishersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_publisher, only: [:show, :edit, :update, :destroy, :add_publisher_comment, :remove_publisher_comment]

  # GET /publishers
  # GET /publishers.json
  def index
    @publishers = Publisher.all
  end
  # GET /publishers/1
  # GET /publishers/1.json
  def show
    @books = Book.all
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
    publishercomment = @publisher.publisher_comments.find(params[:publisher_comment_id])
    @publisher.publisher_comments.delete(publishercomment)
    redirect_to publisher_path
  end

  # POST /publishers
  # POST /publishers.json
  def create
    @publisher = Publisher.new(publisher_params)

    respond_to do |format|
      if @publisher.save
        format.html { redirect_to memberships_path, notice: 'Publisher was successfully created.' }
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
        format.html { redirect_to @publisher, notice: 'Publisher was successfully updated.' }
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
      format.html { redirect_to publishers_url, notice: 'Publisher was successfully destroyed.' }
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
      params.require(:publisher).permit(:name, :rut, :giro, :user_id, :id)
    end
end
