class Admins::SeasoningsSpicesController < ApplicationController

  def new
    @seasoning_spice = SeasoningSpice.new
  end

  def create
    @seasoning_spice = current_admin.seasoning_spices.build(seasoning_spice_params)
    if @seasoning_spice.save
      redirect_to admins_seasonings_spice_path(@seasoning_spice.id)
    else
      render :new
    end
  end

  def show
    @seasoning_spice = SeasoningSpice.find(params[:id])
  end

  def edit
    @seasoning_spice = SeasoningSpice.find(params[:id])
  end

  def update
    @seasoning_spice = SeasoningSpice.find(params[:id])
    if @seasoning_spice.update(seasoning_spice_params)
      redirect_to admins_seasonings_spice_path(@seasoning_spice)
    else
      render :edit
    end
  end

  private

  def seasoning_spice_params
    params.require(:seasoning_spice).permit(:image, :classification, :name, :detail, :usega)
  end
end
