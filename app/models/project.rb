class Project < ApplicationRecord
  belongs_to :user
  has_many :project_members, dependent: :destroy
  has_many :members, through: :project_members, source: :user

  validates :name, :description, presence: true

  def owner?(user)
    self.user_id == user.id
  end

  def member?(user)
    members.include?(user)
  end
end
