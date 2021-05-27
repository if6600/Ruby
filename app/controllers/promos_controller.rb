class PromosController < ApplicationController
  before_action :set_promo, only: %i[show edit destroy]
  before_action :require_permission, except: %i[index show new]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @promos = Promo.all
  end

  def show; end

  def new
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

  private

  def set_promo
    @promo = Promo.find(params[:id])
  end

  def require_permission
    redirect_to root_path if current_user.isadmin == false
  end

end
