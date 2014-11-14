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
    
    if @post.post_id # Creating a reply post
      redirect_to :back, id: @post.post_id 
    else
      redirect_to posts_url(page: page)
    end
  end
  
  def new_reply
    @reply = Post.new
    @post = Post.find(params[:post_id])
    render :partial => "form", :locals => { :post => @reply, post_id: @post.id }
  end

  private
  
  def post_params
    params.require(:post).permit(:message, :post_id)
  end
end
