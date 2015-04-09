require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        @vote1 = Vote.new(value: -1)
        @vote2 = Vote.new(value: 1)
        @vote3 = Vote.new(value: 10)

        expect( @vote1.valid? ).to eq(true) 
        expect( @vote2.valid? ).to eq(true)
        expect( @vote3.valid? ).to eq(false)
      end
    end
  end
end