class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def create
    @post = current_user.posts.build(permitted_parameters)
    respond_to do |format|
      if @post.save
        redirect_to posts_path, notice: "作成しました" 
      else
        render :new
      end
    end

  def update
    if @post.update(permitted_parameters)
        redirect_to posts_path, notice: '編集しました'
      else
        render :new
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice: '削除しました'
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def permitted_parameters
    params.require(:post).permit(:title, :content, :image)
  end
end

