Hanami::Model.migration do
  change do
    create_table :messages do
      primary_key :id

      column :text,   String, null: false
      column :key,    String, null: false

      column :visits_remains,   Integer
      column :time_remains,     Integer

      column :expiration_time,  DateTime
      column :created_at,       DateTime, null: false
      column :updated_at,       DateTime, null: false
    end
  end
end
