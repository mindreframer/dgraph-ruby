require "test_helper"

describe Dgraph::Config do
  let(:instance) { Dgraph::Config.instance }
  describe :root do
    it do
      assert_match /dgraph$/, instance.root.to_s
    end
  end
end
