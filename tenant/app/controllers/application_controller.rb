class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  set_current_tenant_through_filter
  before_action :set_tenant

  def set_tenant
    current_tenant = Tenant.find_by_path!(ENV['RAILS_RELATIVE_URL_ROOT'])
    set_current_tenant(current_tenant)
  end
end
