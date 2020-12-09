class BugsController < ApplicationController

  load_and_authorize_resource
  
  before_action :set_bug, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @bugs = Bug.all.order('created_at DESC')
  end

  def show
  end

  def new
    @bug = current_user.bugs.build
  end

  def create
    @bug = current_user.bugs.build(bug_params)

    respond_to do |format|
      if @bug.save
        format.html { redirect_to bugs_url, notice: 'Bug report successfully submitted.' }
        format.json { render :show, status: :created, location: @bug }
      else
        format.html { render :new }
        format.json { render json: @bug.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bug.destroy
    respond_to do |format|
      format.html { redirect_to bugs_url, notice: 'Bug report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bug
      @bug = Bug.find(params[:id])
    end

    def bug_params
      params.require(:bug).permit(:message, :user_id)
    end
end
