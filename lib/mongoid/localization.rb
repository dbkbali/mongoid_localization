module Mongoid

  # this module adds attribute reader and writer methods for any mongoid document fields
  # that have :localize set to true. This methods will access or write a hash of translations to any
  # of these fields by using methods with "_translations" appended to them

  module Localization
    extend ActiveSupport::Concern

    module ClassMethods
      
      def create_accessors(name, meth, options ={})
        self.fields.keys.each do |field|
          if self.fields[field].options[:localize] == true
            define_method("#{field}_translations") {read_attribute(field)}
            define_method("#{field}_translations=") do |value|
              if value.is_a?(Hash)
                start_locale = I18n.locale
                value.keys.each do |key|
                  if I18n.available_locales.include?(key.to_sym)
                    I18n.locale = key
                    write_attribute(field, value[key])
                  end
                  I18n.locale = start_locale
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

end
