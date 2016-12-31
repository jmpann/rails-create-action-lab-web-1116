class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
    ###need to look into why tests 6 and 7, features/student_spec.rb lines 26-43 failed when this line wasn't inserted, passed when it was added, but also passed when bin/rake db:migrate RAILS_ENV=development was run and this line was deleted.
    ###followup Q, what is the difference between the New Action and the Create Action here. 
  end

  def create
    @student = Student.create(first_name: params[:first_name], last_name: params[:last_name])
    redirect_to student_path(@student)
  end

end
