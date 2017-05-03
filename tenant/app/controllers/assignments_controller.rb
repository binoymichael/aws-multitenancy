require 'open3'
require 'zip'

class AssignmentsController < ApplicationController

  before_action :authenticate_user!

  def index
    render :json => '{foo: "bar"}'
  end

  def new
    @assignment = current_user.assignments.build
  end

  def create
    @assignment = current_user.assignments.build(assignment_params)

    tempdir = Dir.mktmpdir
    begin
      Zip::File.open(@assignment.java_source_zip.tempfile) do |zip_file|
        zip_file.each do |f|
          fpath = File.join(tempdir, f.name)
          zip_file.extract(f, fpath) unless File.exist?(fpath)
        end
      end

      output_filename = "output_#{Time.now.to_i}"

      commands = ["scripts/umlparser.sh", tempdir, output_filename]
      output, status = Open3.capture2(*commands)

      if status.exitstatus != 0
        # TODO Error handling
        raise 'hell'
      end

      @assignment.diagram = File.open(output_filename + ".png")
      @assignment.save!
      redirect_to edit_assignment_url(@assignment)
    ensure
      FileUtils.remove_entry tempdir
      FileUtils.remove_entry output_filename + ".java" if File.exist?(output_filename + ".java")
      FileUtils.remove_entry output_filename + ".png" if File.exist?(output_filename + ".png")
    end
  end

  def update
    @assignment = current_user.assignments.find(params[:id])
    @assignment.grades = Grade.new(grade_params)
    if @assignment.save
      redirect_to @assignment
    else
      render :edit
    end
  end

  def show
    @assignment = current_user.assignments.find(params[:id])
  end

  def edit
    @assignment = current_user.assignments.find(params[:id])
  end

  def grade_params
    params.require(:assignment).require(:grades).permit(:points, :comments)
  end

  def assignment_params
    params.require(:assignment).permit(:student_id, :description, :assignment_type, :java_source_zip)
  end
end
