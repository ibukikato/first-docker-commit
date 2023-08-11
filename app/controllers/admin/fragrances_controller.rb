class Admin::FragrancesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_fragrance, only: %i[show edit update]

  def index
    @fragrances = Fragrance.all
  end

  def new
    @fragrance = Fragrance.new
  end

  def create
    @fragrance = Fragrance.new(fragrance_params)
    if @fragrance.save
      redirect_to admin_fragrance_path(@fragrance)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @fragrance.update(fragrance_params)
      redirect_to admin_fragrance_path(@fragrance)
    else
      render :edit
    end
  end

  private

  def set_fragrance
    @fragrance = Fragrance.find(params[:id])
  end

  def fragrance_params
    params.require(:fragrance).permit(:name, :description, :image)
  end
end
