class Team < ApplicationRecord
  validates :name, presence: true
  has_many :team_users, dependent: :destroy
  has_many :users, through: :team_users
end
