module ComcenterApi

  # Module for api methods accessing
  module ApiAccessor
    def self.included(base)
      base.extend ClassMethods
      base.class_eval do
      end
    end

    # Return resources namespace.
    # @return [String]
    def resource_namespace
      "ComcenterApi::Resources"
    end

    # Converts string to instance variable name
    # @param [string] name Variable name.
    # @return [String]
    def instance_variable_name(name)
      "@#{name}"
    end

    # Set instance variable with new instance of api resource class .
    # @param [Symbol] Resource Resource name.
    def set_resource_variable(resource)
      instance_variable_set(instance_variable_name(resource), resource_class(resource).new(client: self))
    end

    # Return api resource class by resource name
    # @param [Symbol] Resource Resource name.
    # @return [String]
    def resource_class(resource)
      Object.const_get("#{resource_namespace}::#{resource.capitalize}")
    end

    module ClassMethods

      # DSL method for api resource access
      # @param [Array Symbol] Resources Array of resources.
      def use_resources(resources)
        resources.each {|resource| define_resource_method(resource)}
      end

      # Creates getters for api resources. Getters names - pluralized resource names.
      # E.g. resouce channel, method: channels, etc
      # @param [string] Resources Array of resources.
      # @return [Instance] instance of api resource
      def define_resource_method(resource)
        define_method resource.to_s.pluralize do
          set_resource_variable(resource) if !instance_variable_defined?(instance_variable_name(resource))
          instance_variable_get(instance_variable_name(resource))
        end
      end

    end

  end

end
