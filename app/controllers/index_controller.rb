class IndexController < ApplicationController
  def index
    @volumes = Volume.all
  end
end
