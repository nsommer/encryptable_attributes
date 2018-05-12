require 'active_support/concern'
require 'active_support/core_ext/class'
require 'active_support/message_encryptor'

module EncryptableAttributes
  module Base
    extend ActiveSupport::Concern

    included do
      class_attribute :_secure_key
    end

    # Override ActiveRecord accessor
    def [](key)
      send key
    end

    # Override ActiveRecord accessor
    def []=(key, value)
      send "#{key}=", value
    end

    class_methods do
      def secure_key(key)
        self._secure_key = key
      end

      def secure_attrs(*attr_names)
        attr_names.each do |attr_name|
          define_method :"#{attr_name}=" do |value|
            write_attribute(attr_name, crypt.encrypt_and_sign(value))
          end

          define_method :"#{attr_name}" do
            crypt.decrypt_and_verify(read_attribute(attr_name))
          end
        end
      end
    end

    protected

      def new_crypt
        len    = ActiveSupport::MessageEncryptor.key_len
        salt   = SecureRandom.random_bytes(len)
        key    = ActiveSupport::KeyGenerator.new(static_or_dynamic_secure_key).generate_key(salt, len)
        @crypt = ActiveSupport::MessageEncryptor.new(key)
      end

      def crypt
        @crypt ||= new_crypt
      end

      def static_or_dynamic_secure_key
        if self._secure_key.is_a?(String)
          self._secure_key
        elsif self._secure_key.is_a?(Symbol)
          send self._secure_key
        else
          raise ArgumentError, "#{self._secure_key} bust be of type String or Symbol, but is of type #{self._secure_key.class}"
        end
      end
  end
end
