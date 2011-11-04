module Mongoid::Localization
  extend ActiveSupport::Concern

  module ClassMethods
    def create_accessors(name, meth, options ={})
      self.fields.keys.each do |field|
        if self.fields[field].options[:localize] == true
          define_method("#{field}_translations") {read_attribute(field)}
          define_method("#{field}_translations=") do |value|
            if value.is_a?(Hash)
              value.keys.each do |key|
                if I18n.available_locales.include?(key.to_sym)
                  I18n.locale = key
                  write_attribute(field, value[key])
                end
              end
            end
          end
        else
          super
        end
      end
    end
  end
end
