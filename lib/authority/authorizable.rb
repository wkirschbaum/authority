# frozen_string_literal: true

module Authority::Authorizable
  extend ActiveSupport::Concern

  included do
    before_action :authorize!

    def authorize!
      raise Authority::Error, 'Authorization not set' if @authorize_allow_results.blank?
      raise Authority::Error, 'Unauthorized' unless @authorize_allow_results.any?
    end
    protected :authorize!

    def visible_to(scopes)
      scopes = [scopes] unless scopes.is_a?(Array)
      yield if scopes.any? { |scope| Store.allow?(current_user, scope) }
    end
    helper_method :visible_to
    protected :visible_to
  end

  class_methods do
    def allow(scope, modifiers = {})
      method_name = "authorize_allow_#{scope}".to_sym
      define_method(method_name) do
        @authorize_allow_results ||= []
        @authorize_allow_results << if modifiers[:only].present?
                                      (
                                        modifiers[:only].include?(params[:action].to_sym) &&
                                        Store.allow?(current_user, scope)
                                      )
                                    else
                                      Store.allow?(current_user, scope)
                                    end
      end
      # Add authorize at the end ensures that authorize always gets called last
      before_action method_name, :authorize!
    end
  end
end
