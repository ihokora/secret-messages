Hanami::Model.migration do
  change do
    create_table :messages do
      primary_key :id

      column :encrypted_text,   String, null: false
      column :token,            String, null: false

      column :visits_remaining  Integer
      column :expiration_time,  DateTime, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
  end
end
