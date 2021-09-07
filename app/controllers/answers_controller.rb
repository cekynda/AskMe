class AnswersController < ApplicationController
  before_action :set_question
  before_action :set_answer, except: :create
  
  def create
    @answer = @question.answers.create answer_params

    if @answer.save
      flash[:success] = "Answer created!"
      redirect_to question_path(@question)
    else
      render 'questions/show'
    end
  end

  def edit
  end

  def update
    if @answer.update answer_params
      redirect_to question_path(@question)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @answer.destroy
    redirect_to question_path(@question)
  end

  private

  def answer_params
    params.require(:answer).permit(:answerer, :body)
  end

  def set_question
    @question = Question.find params[:question_id]
  end

  def set_answer
    @answer = @question.answers.find params[:id]
  end
end
