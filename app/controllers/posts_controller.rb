class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def store
    # upload image to cloudinary
    
    @value = Cloudinary::Uploader.upload(params[:image], :resource_type => :auto)
    # create a new post object and save to db
    @post = Post.new({:link => @value['secure_url'], :caption => params[:caption]})
    
    if @post.save
      # broadcasting posts using pusher
      Pusher.trigger('posts-channel','new-post', {
        link: @post.link,
        caption: @post.caption
      })
    end 
    redirect_to('/')
  end

  def edit
  
  end
  
  def update
    if @post.update(post_params)
      redirect_to @post
    else 
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to('/') 
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:link, :caption)
  end
end
