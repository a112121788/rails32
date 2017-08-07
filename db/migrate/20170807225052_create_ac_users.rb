class CreateAcUsers < ActiveRecord::Migration
  def change
    create_table :ac_users do |t|
      t.string :name

      t.timestamps
    end
  end
end
