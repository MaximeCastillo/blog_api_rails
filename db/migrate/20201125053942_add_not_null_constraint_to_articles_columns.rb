class AddNotNullConstraintToArticlesColumns < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:articles, :title, false)
    change_column_null(:articles, :content, false)
  end
end
