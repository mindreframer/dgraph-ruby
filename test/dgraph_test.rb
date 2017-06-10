require 'test_helper'

class DgraphTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Dgraph::VERSION
  end
end
