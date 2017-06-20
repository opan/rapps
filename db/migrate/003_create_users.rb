Sequel.migration do
  up do
    create_table :users do
      primary_key :id
      column :username, String, null: false, size: 100, unique: true
      column :email, String, null: false, unique: true
      column :encrypted_password, String, null: false
      column :created_at, DateTime
      column :updated_at, DateTime
    end
  end

  down do
    drop_table :users
  end
end
