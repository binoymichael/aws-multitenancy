class Assignment < ApplicationRecord
  acts_as_tenant(:tenant)
  attr_accessor :java_source_zip

  has_attached_file :diagram
  validates_attachment :diagram, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg+xml"] }
end

