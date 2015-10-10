require 'spec_helper'

RSpec.describe "/about_us" do
  pending "add some examples to #{__FILE__}" do
    before do
      get "/about_us"
    end

    it "returns hello world" do
      expect(last_response.body).to eq "Hello World"
    end
  end
end
