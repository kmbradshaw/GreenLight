class User < ActiveRecord::Base
  has_one :redlight

  validates :name, :email, { presence: true }
  validates :email, { uniqueness: true }

  has_secure_password

  def working_on(project)
    project.users.include?(self)
  end

  def unique_projects
    self.projects.distinct
  end 
end