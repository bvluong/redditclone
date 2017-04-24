class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if current_user_.id == @post.user_id
      render :edit
    else
      flash[:errors] = ["not author of the post"]
      redirect_to sub_url(@post.sub)
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @sub = @post.sub
    if @post
      @post.destroy
    end
    redirect_to subs_url
  end

  private

  def post_params
    params.require(:post).permit(:title,:content,:user_id,sub_ids: [])
  end
end
