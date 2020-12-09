class QuestionsController < ApplicationController
 
  load_and_authorize_resource
  skip_authorize_resource :only => [:upvote, :downvote]

  before_action :set_question, only: [:show, :edit, :update, :destroy,:upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @questions = Question.all.order('created_at DESC')
    @users = User.all.last(5)
  end

  def show
    @answer = Answer.new
    @answers = @question.answers.order('created_at DESC')
  end

  def new
    @question = current_user.questions.build
  end

  def edit
  end

  def create
    @question = current_user.questions.build(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote 
    @question.upvote_by current_user
    redirect_back fallback_location: root_path
  end 

  def downvote
    @question.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  private
    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:title, :image_link, :user_id)
    end
end
