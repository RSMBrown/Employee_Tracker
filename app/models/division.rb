class Division < ApplicationRecord
    has_many :division_users, dependent: :destroy
    has_many :users, through: :division_users
end
