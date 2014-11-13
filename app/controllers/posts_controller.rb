class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  # GET /posts
  # GET /posts.json
  def index
    @post = Post.new
    puts "page: #{params[:page]}"
    @posts = Post.thread.page params[:page]
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end
  
  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    page = Post.thread.page(1).total_pages
    binding.pry
    flash[:alert] = 'Could not save post' unless @post.save
    puts "p: #{params[:page]}"
    
    redirect_to posts_url(page: page)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:message)
    end
end
