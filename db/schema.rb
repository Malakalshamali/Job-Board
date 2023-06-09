# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_509_151_044) do
  create_table 'job_applications', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'phone'
    t.string 'resume'
    t.text 'cover_letter'
    t.string 'status', default: 'NOT_SEEN'
    t.integer 'user_id', null: false
    t.integer 'job_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['job_id'], name: 'index_job_applications_on_job_id'
    t.index ['user_id'], name: 'index_job_applications_on_user_id'
  end

  create_table 'jobs', force: :cascade do |t|
    t.string 'title'
    t.string 'description'
    t.string 'company'
    t.string 'location'
    t.string 'job_type'
    t.text 'requirements'
    t.datetime 'published_at'
    t.datetime 'expires_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'role_users', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'role_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['role_id'], name: 'index_role_users_on_role_id'
    t.index ['user_id'], name: 'index_role_users_on_user_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'provider', default: 'email', null: false
    t.string 'uid', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.boolean 'allow_password_change', default: false
    t.datetime 'remember_created_at'
    t.string 'unconfirmed_email'
    t.string 'name'
    t.string 'nickname'
    t.string 'image'
    t.string 'email'
    t.text 'tokens'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.integer 'sign_in_count'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index %w[uid provider], name: 'index_users_on_uid_and_provider', unique: true
  end

  add_foreign_key 'job_applications', 'jobs'
  add_foreign_key 'job_applications', 'users'
  add_foreign_key 'role_users', 'roles'
  add_foreign_key 'role_users', 'users'
end
