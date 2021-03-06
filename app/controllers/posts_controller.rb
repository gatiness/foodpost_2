class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :check_current_user, only: %i[ edit destroy ]

  def index
    @posts = Post.all
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def edit
    # binding.irb
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = @post.comments.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, notice: "作成しました" 
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: '編集しました'
    else
      render :new
    end
  end

  def destroy
    @post.destroy
      redirect_to posts_path, notice: '削除しました'
  end

  private

  def check_current_user
    if @post.user_id != current_user.id
      redirect_to posts_path, notice: '権限がありません'
    end
  end


  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :user_id, label_ids: [])
  end
end

