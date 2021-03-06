# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_502_063_722) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness', unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'comment', null: false
    t.bigint 'shop_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.float 'rate', default: 1.0
    t.index ['shop_id'], name: 'index_comments_on_shop_id'
    t.index ['user_id'], name: 'index_comments_on_user_id'
  end

  create_table 'congestions', force: :cascade do |t|
    t.integer 'status', default: 1, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'comment_id'
    t.integer 'user_id'
    t.integer 'shop_id'
    t.index ['comment_id'], name: 'index_congestions_on_comment_id'
  end

  create_table 'favorites', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'shop_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['shop_id'], name: 'index_favorites_on_shop_id'
    t.index ['user_id'], name: 'index_favorites_on_user_id'
  end

  create_table 'likes', force: :cascade do |t|
    t.bigint 'comment_id', null: false
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['comment_id'], name: 'index_likes_on_comment_id'
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'shops', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'address', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name_kana'
    t.string 'tel'
    t.string 'opentime'
    t.string 'holiday'
    t.boolean 'outret', default: false
    t.boolean 'wifi', default: false
    t.float 'latitude'
    t.float 'longitude'
    t.string 'pr_short'
    t.string 'pref_code'
    t.string 'prefname'
    t.string 'areacode_s'
    t.string 'areaname_s'
    t.boolean 'smoking', default: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'provider'
    t.string 'uid'
    t.string 'name'
    t.boolean 'admin', default: false, null: false
    t.string 'profile_photo'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'comments', 'shops'
  add_foreign_key 'comments', 'users'
  add_foreign_key 'congestions', 'comments'
  add_foreign_key 'likes', 'comments'
  add_foreign_key 'likes', 'users'
end
