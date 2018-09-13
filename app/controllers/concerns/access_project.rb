module AccessProject
  extend ActiveSupport::Concern
  included do
    before_action :check_mecene_for_new_project
  end


  def check_mecene_for_new_project
    if current_mecene
      flash.clear
      redirect_to(mecene_path(current_mecene.id))
    end
  end
end