class AddChartToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :chart, :string
  end
end
