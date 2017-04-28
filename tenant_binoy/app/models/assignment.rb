class Assignment < ApplicationRecord
  acts_as_tenant(:tenant)
  attr_accessor :java_source_zip
end

