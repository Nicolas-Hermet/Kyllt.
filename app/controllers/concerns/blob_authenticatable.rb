# Found on https://gist.github.com/dommmel/4e41b204b97238e9aaf35939ae8e1666
# Rails controller concern to enable Devise authentication for ActiveStorage.
# Put it in +app/controllers/concerns/blob_authenticatable.rb+ and include it when overriding
# +ActiveStorage::BlobsController+ and +ActiveStorage::RepresentationsController+.
# 
# Optional configuration:
# 
# Set the model that includes devise's database_authenticatable.
# Defaults to Devise.default_scope which defaults to the first
# devise role declared in your routes (usually :user)
#
#   blob_authenticatable resource: :admin
#   
# To specify how to determine if the current_user is allowed to access the 
# blob, override the can_access_blob? method
#   
# Minimal example:
# 
#   class ActiveStorage::BlobsController < ActiveStorage::BaseController
#     include ActiveStorage::SetBlob
#     include AdminOrUserAuthenticatable
#     
#     def show
#       expires_in ActiveStorage::Blob.service.url_expires_in
#       redirect_to @blob.service_url(disposition: params[:disposition])
#     end
#   end
# 
# Complete example:
# 
  class ActiveStorage::RepresentationsController < ActiveStorage::BaseController
    include ActiveStorage::SetBlob
    include AdminOrUserAuthenticatable

    blob_authenticatable resource: :admin

    def show
      expires_in ActiveStorage::Blob.service.url_expires_in
      redirect_to @blob.representation(params[:variation_key]).processed.service_url(disposition: params[:disposition])
    end
    
    private

      def can_access_blob?(current_user)
        @blob.attachments.map(&:record).all? { |record| record.user == current_user }
      end
  end

module BlobAuthenticatable
  extend ActiveSupport::Concern

  included do
    around_action :wrap_in_authentication
  end
  
  module ClassMethods
    def auth_resource
      @auth_resource || Devise.default_scope
    end

    private

      def blob_authenticatable(resource:)
        @auth_resource = resource
      end
  end

  private

    def wrap_in_authentication
      is_signed_in_and_authorized = send("#{self.class.auth_resource}_signed_in?") \
        & can_access_blob?(send("current_#{self.class.auth_resource}"))

      if is_signed_in_and_authorized
        yield
      else
        head :unauthorized
      end
    end

    def can_access_blob?(_user)
      true
    end
end