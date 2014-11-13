class PostsController < ApplicationController

  def index
    @post = Post.new
    puts "page: #{params[:page]}"
    @posts = Post.thread.page params[:page]
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(post_params)
    page = Post.thread.page(1).total_pages
    flash[:alert] = 'Could not save post' unless @post.save
    puts "p: #{params[:page]}"
    
    redirect_to posts_url(page: page)
  end

  private
  
  def post_params
    params.require(:post).permit(:message)
  end
end
