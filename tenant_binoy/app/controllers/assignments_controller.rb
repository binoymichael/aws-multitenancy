class AssignmentsController < ApplicationController

  before_action :authenticate_user!

  def index
    render :json => '{foo: "bar"}'
  end

  def new
  end
end
