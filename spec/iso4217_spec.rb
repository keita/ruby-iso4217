$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "rubygems"
require "bacon"
require "iso4217"

describe "ISO4217" do
  it "code" do
    ISO4217::JPY.code.should == "JPY"
  end

  it "code" do
    ISO4217::JPY.num.should == 392
  end

  it "currency" do
    ISO4217::JPY.currency.should == "Yen"
  end

  it "locations" do
    ISO4217::JPY.locations.should == ["JAPAN"]
  end

  it "ccc" do
    ISO4217::JPY.ccc.should.be.false
  end

  it "obsolete" do
    ISO4217::JPY.obsolete.should.be.nil
    ISO4217::CYP.obsolete.should == ISO4217::EUR
  end
end
