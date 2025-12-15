class ProjectMember < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum :role, { collaborator: 0, manager: 1 }

  validates :project_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :project_id }
end
