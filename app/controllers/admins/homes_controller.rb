class Admins::HomesController < ApplicationController

  def top
    @seasonings_spices = SeasoningSpice.all
  end

end
