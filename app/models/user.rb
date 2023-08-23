class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings
  has_many :boats
  has_many :reviews, through: :bookings
end

# rails aborted!
# ActiveRecord::InvalidForeignKey: PG::ForeignKeyViolation:
# ERROR:  update or delete on table "users" violates foreign
# key constraint "fk_rails_1298c6ca90" on table "boats"
#
# DETAIL:  Key (id)=(1) is still referenced from table "boats".
# /Users/mardgelleneri/code/tinydancer96/boat-bnb/db/seeds.rb:9:in
# `<main>'

# Caused by:
# PG::ForeignKeyViolation: ERROR:  update or delete on table "users"
# violates foreign key constraint "fk_rails_1298c6ca90" on table "boats"
# DETAIL:  Key (id)=(1) is still referenced from table "boats".
# /Users/mardgelleneri/code/tinydancer96/boat-bnb/db/seeds.rb:9:in `<main>'
# Tasks: TOP => db:seed
# (See full trace by running task with --trace)
