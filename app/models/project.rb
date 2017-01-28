class Project < ApplicationRecord
  validates :title, :description, :link, presence: true
end
