require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test '#email_address_with_name' do
    assert_equal "'Klaus' <klaus@foo.bar>",
                 players(:klaus).email_address_with_name
  end
end
