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

  end

  private

  def seasoning_spice_params
    params.require(:seasoning_spice).permit(:image, :classification, :name, :detail, :usega)
  end
end
