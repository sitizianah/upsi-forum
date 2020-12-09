class AnswersController < ApplicationController
	
	#load_authorize_resource

	before_action :set_answer
	before_action :authenticate_user!, only:[:create, :destroy]
	
	def create
		@answer = @question.answers.new(answer_params)
		@answer.user = current_user
		@answer.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@answer = @question.answers.find(params[:id])
		@answer_id = @answer.id
		@answer.destroy
	end

	private
	def answer_params
		params.require(:answer).permit(:body, :question_id)
	end
	def set_answer
		@question = Question.find(params[:question_id])
   end
   
end
