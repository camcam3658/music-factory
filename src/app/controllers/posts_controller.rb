class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.song.attach(params[:post][:song])
    if @post.song.present?
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
    Post.destroy
    flash[:success] = "楽曲を削除しました"
    redirect_to request.referrer || root_url
  end

  private
    def post_params
      params.require(:post).permit(:caption,:song).merge(user_id: current_user.id)
    end

end
