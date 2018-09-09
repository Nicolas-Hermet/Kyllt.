module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_mecene
      flash.clear
      # if you have rails_admin. You can redirect anywhere really
      redirect_to(mecene_path) && return
    elsif current_artist
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(artist_path) && return
    # elsif current_admin
    #   flash.clear
    #   # if you have rails_admin. You can redirect anywhere really
    #   redirect_to(rails_admin.dashboard_path) && return
    end
  end
end