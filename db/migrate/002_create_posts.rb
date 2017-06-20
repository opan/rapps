Sequel.migration do
  up do
    create_table :posts do
      primary_key :id
      column :title, String, size: 100, null: false
      column :content, String, text: true, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :posts
  end
end
