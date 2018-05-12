require "test_helper"

class EncryptableAttributesTest < Minitest::Test
  def setup
    @user = User.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::EncryptableAttributes::VERSION
  end

  def test_that_class_responds_to_setup_methods
    assert @user.class.respond_to?(:secure_key)
    assert @user.class.respond_to?(:secure_attrs)
  end

  def test_encryption_and_decryption_lifecycle_with_method_accessors
    @user.secret_info = 'top secret'

    # Use #send to read private value of attribute
    refute_equal @user.send(:read_attribute, :secret_info), 'top secret'

    assert_equal @user.secret_info, 'top secret'
  end

  def test_encryption_and_decryption_lifecycle_with_hash_accessors
    @user[:secret_info] = 'top secret'

    # Use #send to read private value of attribute
    refute_equal @user.send(:read_attribute, :secret_info), 'top secret'

    assert_equal @user[:secret_info], 'top secret'
  end
end
