class PromosController < ApplicationController
  before_action :set_promo, only: %i[show edit destroy]
  before_action :require_permission, except: %i[index show new create]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @promos = Promo.all
  end

  def show; end

  def new
    @promo = Promo.new
    @action = 'Добавить'
  end

  def edit
    @action = 'Изменить'
    render 'new'
  end

  def destroy
    @promo.destroy
    redirect_to promos_path
  end

  def create
    @promo = Promo.new(promo_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @promo.save
        format.html { redirect_to @promo, notice: 'Новость была успешно создана.' }
        format.json { render :show, status: :created, location: @promo }
      else
        format.html { render :new }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @promo.update(promo_params)
        format.html { redirect_to @promo, notice: 'Новость была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @promo }
      else
        format.html { render :edit }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_promo
    @promo = Promo.find(params[:id])
  end

  def require_permission
    redirect_to root_path if current_user.isadmin == false
  end

  # Only allow a list of trusted parameters through.
  def promo_params
    params.require(:promo).permit(:title, :content, :image, :is_published)
  end

end
