class VisitorsController < ApplicationController
  layout 'visitors'

  def welcome
    @icecreams = Icecream.all
  end
end
