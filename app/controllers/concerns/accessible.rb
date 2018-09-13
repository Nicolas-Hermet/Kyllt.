module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_user
  end

  protected
  def check_user
    if current_mecene
      flash.clear
      redirect_to(mecene_path(current_mecene.id)) && return
    elsif current_artist
      flash.clear
      redirect_to(artist_path(current_artist.id)) && return
    end
  end
end