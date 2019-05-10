class Api::V2::PostsController < ApplicationController
  before_action :set_api_v2_post, only: [:show, :edit, :update, :destroy]

  # GET /api/v2/posts
  # GET /api/v2/posts.json
  def index
    @api_v2_posts = Api::V2::Post.all
  end

  # GET /api/v2/posts/1
  # GET /api/v2/posts/1.json
  def show
  end

  # GET /api/v2/posts/new
  def new
    @api_v2_post = Api::V2::Post.new
  end

  # GET /api/v2/posts/1/edit
  def edit
  end

  # POST /api/v2/posts
  # POST /api/v2/posts.json
  def create
    @api_v2_post = Api::V2::Post.new(api_v2_post_params)

    respond_to do |format|
      if @api_v2_post.save
        format.html { redirect_to @api_v2_post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @api_v2_post }
      else
        format.html { render :new }
        format.json { render json: @api_v2_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v2/posts/1
  # PATCH/PUT /api/v2/posts/1.json
  def update
    respond_to do |format|
      if @api_v2_post.update(api_v2_post_params)
        format.html { redirect_to @api_v2_post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @api_v2_post }
      else
        format.html { render :edit }
        format.json { render json: @api_v2_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v2/posts/1
  # DELETE /api/v2/posts/1.json
  def destroy
    @api_v2_post.destroy
    respond_to do |format|
      format.html { redirect_to api_v2_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v2_post
      @api_v2_post = Api::V2::Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v2_post_params
      params.require(:api_v2_post).permit(:status, :content)
    end
end
