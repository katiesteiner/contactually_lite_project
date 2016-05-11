require 'rails_helper'

describe Contact do
  describe "import file" do
    it "imports the file" do
      expect(Contact).to receive(:import).with("foo.txt")
      post :import, file: "foo.txt"
    end
  end
end