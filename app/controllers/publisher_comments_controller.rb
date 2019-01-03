class PublisherCommentsController < ApplicationController
  before_action :set_publisher_comment, only: [:show, :edit, :update, :destroy]

  # GET /publisher_comments
  # GET /publisher_comments.json
  def index
    @publisher_comments = PublisherComment.all
  end

  # GET /publisher_comments/1
  # GET /publisher_comments/1.json
  def show
  end

  # GET /publisher_comments/new
  def new
    @publisher_comment = PublisherComment.new
  end

  # GET /publisher_comments/1/edit
  def edit
  end

  # POST /publisher_comments
  # POST /publisher_comments.json
  def create
    @publisher_comment = PublisherComment.new(publisher_comment_params)

    respond_to do |format|
      if @publisher_comment.save
        format.html { redirect_to @publisher_comment, notice: 'Publisher comment was successfully created.' }
        format.json { render :show, status: :created, location: @publisher_comment }
      else
        format.html { render :new }
        format.json { render json: @publisher_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publisher_comments/1
  # PATCH/PUT /publisher_comments/1.json
  def update
    respond_to do |format|
      if @publisher_comment.update(publisher_comment_params)
        format.html { redirect_to @publisher_comment, notice: 'Publisher comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @publisher_comment }
      else
        format.html { render :edit }
        format.json { render json: @publisher_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publisher_comments/1
  # DELETE /publisher_comments/1.json
  def destroy
    @publisher_comment.destroy
    respond_to do |format|
      format.html { redirect_to publisher_comments_url, notice: 'Publisher comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publisher_comment
      @publisher_comment = PublisherComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publisher_comment_params
      params.require(:publisher_comment).permit(:content, :publisher_id, :user_id)
    end
end
