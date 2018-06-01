require File.expand_path('../abstract_unit', __FILE__)

class TestAliasAttribute < ActiveSupport::TestCase
  fixtures :departments

  def test_alias_attribute_to_id
    Department.class_eval do
      alias_attribute :id, :department_id
    end

    error = nil
    Department.find([1,1]).update_attribute(:location_id, 3)
  rescue StandardError => e
    error = e
  ensure
    assert_nil(error)
  end
end
