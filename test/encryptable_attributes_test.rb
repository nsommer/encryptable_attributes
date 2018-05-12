require "test_helper"

class EncryptableAttributesTest < Minitest::Test
  def setup
    @message = Message.new
  end

  def test_that_it_has_a_version_number
    refute_nil ::EncryptableAttributes::VERSION
  end

  def test_that_class_responds_to_setup_methods
    assert_respond_to Message, :secure_key
    assert_respond_to Message, :secure_attrs
  end

  def test_encryption_and_decryption_lifecycle_with_method_accessors
    @message.title = 'top secret'

    # Use #send to read private value of attribute
    refute_equal @message.send(:read_attribute, :title), 'top secret'

    assert_equal @message.title, 'top secret'
  end

  def test_encryption_and_decryption_lifecycle_with_hash_accessors
    @message[:title] = 'top secret'

    # Use #send to read private value of attribute
    refute_equal @message.send(:read_attribute, :title), 'top secret'

    assert_equal @message[:title], 'top secret'
  end
end
