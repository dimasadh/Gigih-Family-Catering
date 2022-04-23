class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show edit update destroy ]

  def index
    @menus = Menu.all
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def edit
    @menu.category_id
  end

  def create
    @menu = Menu.new(menu_params)

    if @menu.save
      redirect_to menu_url(@menu), notice: "Menu was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @menu.update(menu_params)
      redirect_to menu_url(@menu), notice: "Menu was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @menu.destroy
    redirect_to menus_url, notice: "Menu was successfully destroyed."
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:name, :price, :description, :category_id)
    end
end
