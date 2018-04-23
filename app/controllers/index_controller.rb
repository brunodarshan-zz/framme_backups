class IndexController < ApplicationController
  def index
    @logs = Log.all
    @volumes = Volume.all
  end
end
