class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order(updated_at: :DESC)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post created"
      redirect_to posts_path
    else
      flash.now[:alert] = "Please fix errors"
      render :new
    end
  end

  def show
    # @post = Post.find params[:id]
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit
    # @post = Post.find params[:id]
  end

  def update
    # @post = Post.find params[:id]

    if @post.update(post_params)
      redirect_to posts_path, notice: "Successfully Updated"
    else
      flash.now[:alert] = 'Please fix errors'
      render :new
    end

  end

  def destroy
    # @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path,notice: "Post Deleted"
  end

  private

  def post_params
    params.require(:post).permit([:title, :body, :category_id])
  end

  def find_post
  @post = Post.find params[:id]
  end

end
