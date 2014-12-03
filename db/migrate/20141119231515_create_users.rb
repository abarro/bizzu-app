class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :cpf
      t.integer :sales
      t.string :email

      t.timestamps
    end
  end
end
