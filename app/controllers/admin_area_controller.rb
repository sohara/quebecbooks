class AdminAreaController < ApplicationController
  before_filter :authorize
  layout "admin_area"
end
