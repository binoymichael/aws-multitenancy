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

      commands = ["scripts/umlparser.sh", tempdir, "output_#{Time.now.to_i}"]
      output, status = Open3.capture2(*commands)
      render json: output.to_s
    ensure
      FileUtils.remove_entry tempdir
    end

  #if status.exitstatus != 0
    ## TODO Better exception
    #raise 'Error'

  end

  def assignment_params
    params.require(:assignment).permit(:student_id, :description, :assignment_type, :java_source_zip)
  end
end
