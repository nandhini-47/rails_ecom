class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2
      t.timestamps
    end
  end
end

# browser
# 
# user can disable in browser 

# advan
# validation is common for andrid,ios
# disadvan
# requests the network which takes time

# Advan
# rails validation are data base agnostic it will for all data bases like pg, mysql


# disadvan
# if database access is accesed by more than 1 application - have validation in database
# for trigger/store procedure will have dif lang