require "test_helper"

describe Dgraph::Sand::Controller do
  let(:instance) { Dgraph::Sand::Controller.new }
  describe :binary_path do
    it do
      assert_includes instance.binary_path, "tmp/dgraph/dgrap"
    end
  end
end
