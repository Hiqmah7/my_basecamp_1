class User < ApplicationRecord
  has_secure_password

  enum :role, { member: 0, admin: 1 }

  has_many :projects, dependent: :destroy
  has_many :project_members, dependent: :destroy
  has_many :member_projects, through: :project_members, source: :project

  validates :name, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || changes[:password_digest] }
end
