# frozen_string_literal: true

module Prefab
  module Base
    extend ActiveSupport::Concern

    class_methods do
      def prefab(resource_name, parent: nil, permitted_params: nil)
        include Prefab::Controller

        @resource_name    = resource_name.to_s.singularize
        @parent_name      = parent&.to_s&.singularize
        @permitted_params = permitted_params
      end
    end
  end
end
