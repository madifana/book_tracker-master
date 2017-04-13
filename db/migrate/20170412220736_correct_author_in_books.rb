class CorrectAuthorInBooks < ActiveRecord::Migration[5.0]
  def change
  	rename_column :books, :Author, :author
  end
end
