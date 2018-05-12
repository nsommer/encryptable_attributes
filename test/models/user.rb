class User < ActiveRecord::Base
  include EncryptableAttributes::Base

  secure_key 'mysecret'
  secure_attrs :secret_info
end
