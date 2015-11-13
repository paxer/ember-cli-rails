require "ember-cli/constraint"

module ActionDispatch
  module Routing
    class Mapper
      def mount_ember_app(app_name, to:, **options)
        routing_options = options.deep_merge(
          defaults: { ember_app: app_name },
        )

        routing_options.reverse_merge!(
          controller: "ember_cli/ember",
          action: "index",
          format: :html,
        )

        Rails.application.routes.draw do
          scope constraints: EmberCli::Constraint.new do
            get("#{to}(*rest)", routing_options)
          end
        end
      end
    end
  end
end
