class AnswersController < ApplicationController
  http_basic_authenticate_with name: "nikita", password: "95146781", only: [ :destroy, :update ]

  def create
    @question = Question.find params[:question_id]
    @answer = @question.answers.create answer_params
    redirect_to question_path(@question)
    
  end

  def edit
    @question = Question.find params[:question_id]
    @answer = @question.answers.find params[:id]

  end

  def update
    @question = Question.find params[:question_id]
    @answer = @question.answers.find params[:id]

    if @answer.update answer_params
      redirect_to question_path(@question)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:answerer, :body, :status)
  end
end
