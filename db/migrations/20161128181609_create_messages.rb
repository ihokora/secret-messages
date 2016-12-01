Hanami::Model.migration do
  change do
    create_table :messages do
      primary_key :id

      column :encrypted_text,   String, null: false
      column :key,              String, null: false
      column :iv,               String
      column :visits_remaining, Integer
      column :expiration_time,  DateTime

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
