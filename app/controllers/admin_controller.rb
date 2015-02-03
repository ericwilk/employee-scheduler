class AdminController < ApplicationController
  before_filter :admin?

  # Do admin stuff here, such as create users, etc.
end
