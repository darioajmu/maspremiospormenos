# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160229191309) do

  create_table "premios", force: :cascade do |t|
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "codigo",         limit: 255
    t.string   "nombre",         limit: 255
    t.date     "fechadebaja"
    t.integer  "tipospremio_id", limit: 4
  end

  create_table "provincias", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "codigo",      limit: 255
    t.string   "nombre",      limit: 255
    t.date     "fechadebaja"
  end

  create_table "tiposdocumentos", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "codigo",      limit: 255
    t.string   "nombre",      limit: 255
    t.date     "fechadebaja"
  end

  create_table "tipospremios", force: :cascade do |t|
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "codigo",      limit: 255
    t.string   "nombre",      limit: 255
    t.date     "fechadebaja"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  limit: 255,                default: "", null: false
    t.string   "encrypted_password",     limit: 255,                default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,                  default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",               limit: 255
    t.integer  "tiposdocumento_id",      limit: 4
    t.string   "documento",              limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "nombre",                 limit: 255
    t.string   "apellido1",              limit: 255
    t.string   "apellido2",              limit: 255
    t.integer  "provincia_id",           limit: 4
    t.string   "ciudad",                 limit: 255
    t.decimal  "codigopostal",                       precision: 10
    t.string   "direccion",              limit: 255
    t.string   "direccioncompleta",      limit: 255
    t.date     "fechadenacimiento"
    t.string   "sexo",                   limit: 255
    t.decimal  "movil",                              precision: 10
  end

  add_index "usuarios", ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true, using: :btree
  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
