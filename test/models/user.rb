class User < ActiveRecord::Base
  include EncryptableAttributes::Base

  secure_key :user_encryption_key
  secure_attrs :salary

  private

    def user_encryption_key
      'something dynamic'
    end
end
