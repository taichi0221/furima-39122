class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,             null: false, default: ""
      t.text       :explanation,      null: false, default: ""
      t.integer    :category_id       null: false, default: ""
      t.timestamps
    end
  end
end


name              | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| situation_id      | integer    | null: false                    |
| price             | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| shipping_day_id   | integer    | null: false                    |
| delivery_charge_id| integer    | null: false                    |
| user              | references | null: false, foreign_key: true |