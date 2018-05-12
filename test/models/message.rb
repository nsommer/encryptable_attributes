class Message < ActiveRecord::Base
  include EncryptableAttributes::Base

  secure_key 'mysecret'
  secure_attrs :title, :body
end
