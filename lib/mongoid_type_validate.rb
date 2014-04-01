require "mongoid_type_validate/version"

module Mongoid
  module Document
    extend ActiveSupport::Concern
    include Mongoid::Components
    included do
      before_validation do
        attributes.each_pair { |x,y| errors.add(x,y.gsub("Mongoid::Errors::InvalidType:","")) if (y =~ /^Mongoid::Errors::InvalidType:/) == 0}
      end
    end
  end
end

module MongoidTypeValidate
  module Number
    module ClassMethods
      def mongoize(object)
        if object.numeric?
          super(object)
        else
          "Mongoid::Errors::InvalidType: expected Numeric Value got: '#{object.to_s}'"
        end
      end
    end
  end
  module Time
    module ClassMethods
      def mongoize(object)
        if (::Time.parse(object.to_s) rescue false)
          super(object)
        else
          "Mongoid::Errors::InvalidType: expected Time Value got: '#{object.to_s}'"
        end
      end
    end
  end
end
::Float.__send__(:extend, MongoidTypeValidate::Number::ClassMethods)
::Integer.__send__(:extend, MongoidTypeValidate::Number::ClassMethods)
::Time.__send__(:extend, MongoidTypeValidate::Time::ClassMethods)
::DateTime.__send__(:extend, MongoidTypeValidate::Time::ClassMethods)
