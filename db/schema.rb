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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "premios", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "codigo"
    t.string   "nombre"
    t.date     "fechadebaja"
    t.integer  "tipospremio_id"
  end

  create_table "provincias", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "codigo"
    t.string   "nombre"
    t.date     "fechadebaja"
  end

  create_table "tiposdocumentos", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "codigo"
    t.string   "nombre"
    t.date     "fechadebaja"
  end

  create_table "tipospremios", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "codigo"
    t.string   "nombre"
    t.date     "fechadebaja"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "tiposdocumento_id"
    t.string   "documento"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "nombre"
    t.string   "apellido1"
    t.string   "apellido2"
    t.integer  "provincia_id"
    t.string   "ciudad"
    t.decimal  "codigopostal"
    t.string   "direccion"
    t.string   "direccioncompleta"
    t.date     "fechadenacimiento"
    t.string   "sexo"
    t.decimal  "movil"
  end

  add_index "usuarios", ["confirmation_token"], name: "index_usuarios_on_confirmation_token", unique: true, using: :btree
  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
