class AnswersController < ApplicationController
  include ActionView::RecordIdentifier

  http_basic_authenticate_with name: "nikita", password: "95146781", only: [ :destroy, :update ]

  def create
    @question = Question.find params[:question_id]
    @answer = @question.answers.create answer_params
    if @answer.save
      flash[:success] = 'Answer created!'
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def edit
    @question = Question.find params[:question_id]
    @answer = @question.answers.find params[:id]

  end

  def update
    @question = Question.find params[:question_id]
    @answer = @question.answers.find params[:id]

    if @answer.update answer_params
      redirect_to question_path(@question, anchor: dom_id(@answer))
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
