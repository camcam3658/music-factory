class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @post = Post.new
    @post.songs.build
  end

  def create
    @post = Post.new(post_params)
    if @post.songs.present?
      @post.save
      redirect_to root_path
      flash[:success] = "楽曲が投稿されました"
    else
      redirect_to root_path
      flash[:danger] = "投稿に失敗しました"
    end
  end

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    Post.find_by(id: params[:id]).destroy
    flash[:success] = "楽曲を削除しました"
    redirect_to request.referrer || root_url
  end

  private
    def post_params
      params.require(:post).permit(:caption, songs_attributes: [:song]).merge(user_id: current_user.id)
    end

end
