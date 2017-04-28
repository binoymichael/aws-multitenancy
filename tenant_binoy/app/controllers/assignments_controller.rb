class AssignmentsController < ApplicationController

  before_action :authenticate_user!

  def index
    render :json => '{foo: "bar"}'
  end

  def new
    @assignment = current_user.assignments.build
  end
end
