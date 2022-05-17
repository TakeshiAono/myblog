ActiveRecord::Schema.define(version: 2022_05_15_082058) do


  enable_extension "plpgsql"

  create_table "blogs", force: :cascade do |t|
    t.text "title"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
end
