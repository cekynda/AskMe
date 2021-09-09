class AddStatusToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :status, :string
  end
end
