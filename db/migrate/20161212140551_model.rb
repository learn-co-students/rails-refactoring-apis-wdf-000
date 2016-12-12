class Model < ActiveRecord::Migration
  def change
    create_table :github_repos do |t|
      t.string :name
      t.string :html_url
    end
  end


end
