class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :admin_required!

  private

  def admin_required!
    return if current_user.is_a?(Admin)

    flash['alert alert-warning'] = 'Yau are not authorized for view this page.'
    redirect_to root_path
  end
end