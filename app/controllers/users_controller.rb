class UsersController < ApplicationController
  before_action :must_be_authenticated
end
