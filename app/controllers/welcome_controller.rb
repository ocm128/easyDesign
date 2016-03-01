class WelcomeController < ApplicationController

  def index
    @actividades = PublicActivity::Activity.all.order("created_at DESC")
  end

end
