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
    @message.save!

    # Use #send to read private value of attribute
    refute_equal @message.send(:read_attribute, :title), 'top secret'

    assert_equal @message.title, 'top secret'
  end

  def test_encryption_and_decryption_lifecycle_with_hash_accessors
    @message[:title] = 'top secret'
    @message.save!

    # Use #send to read private value of attribute
    refute_equal @message.send(:read_attribute, :title), 'top secret'

    assert_equal @message[:title], 'top secret'
  end

  def test_usage_of_dynamic_secure_key
    user = User.new
    user.salary = '$100k'
    user.save!

    refute_equal user.send(:read_attribute, :title), '$100k'

    assert_equal user.salary, '$100k'
  end

  def test_should_not_touch_secure_attribute_if_blank
    assert_nil @message.title

    @message.title = 'Value present'
    assert_equal @message.title, 'Value present'

    @message.title = nil
    assert_nil @message.title
  end
end
