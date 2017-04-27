class AssignmentsController < ApplicationController

  def index
    render :json => '{foo: "bar"}'
  end

  def new
    render :json => '{foo: "root"}'
  end
end
