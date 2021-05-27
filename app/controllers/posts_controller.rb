class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :require_permission, except: %i[index show new]
  before_action :authenticate_user!, except: %i[index show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = user_signed_in? && current_user.isadmin == true ? Post.all : Post.where(is_published: true)
    @vars = params[:category]
    filtering_params(params).each do |key, value|
      @posts = @posts.public_send("filter_by_#{key}", value) if value.present?
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show; end

  # GET /posts/new
  def new
    @post = Post.new
    @action = 'Добавить'
  end

  # GET /posts/1/edit
  def edit
    @action = 'Изменить'
    render 'new'
  end

  def update_published
    post = Post.find(params[:id])
    if post.is_published
      post.update_attribute :is_published, false
    else
      post.update_attribute :is_published, true
    end
    redirect_to posts_path
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Статья была успешно создана.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Статья была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Статья была успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def require_permission
    redirect_to root_path if (current_user != Post.find(params[:id]).user) || current_user.isadmin == false
  end

  def filtering_params(params)
    params.slice(:user, :category, :starts_with)
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:name, :title, :author1, :content, :image, :category_id, :is_published)
  end
end
