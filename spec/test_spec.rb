require "spec_helper"

describe "Mongoize for Types maps to error string" do
  let(:f_test) { Float.mongoize("asdf") }
  let(:i_test) { Integer.mongoize("asdf") }
  let(:t_test) { Time.mongoize("asdf") }
  let(:dt_test) { DateTime.mongoize("asdf") }


  it "should include Mongoid::Errors::InvalidType String" do
    f_test.should == "Mongoid::Errors::InvalidType: expected Numeric Value got: 'asdf'"
    i_test.should == "Mongoid::Errors::InvalidType: expected Numeric Value got: 'asdf'"
    t_test.should == "Mongoid::Errors::InvalidType: expected Time Value got: 'asdf'"
    dt_test.should == "Mongoid::Errors::InvalidType: expected Time Value got: 'asdf'"
  end
end

describe "Model validates type" do
  let!(:bad_data) { Account.new(name: "asdf", f_number: "asdf", i_number: "asdf", t_time: "asdf", dt_time: "asdf") }
  let!(:good_data) { Account.new(name: "name", f_number: "3.14", i_number: "3", t_time: Time.now.to_s, dt_time: Time.now.to_s) }
  let!(:blank_data) { Account.new(naem: "blank", f_numer: nil, i_number: nil, t_time: nil, dt_time: nil) }

  it "bad data should have validation errors" do
    bad_data.valid?.should == false
    bad_data.errors.messages.should == {:f_number=>[" expected Numeric Value got: 'asdf'"], :i_number=>[" expected Numeric Value got: 'asdf'"], :t_time=>[" expected Time Value got: 'asdf'"], :dt_time=>[" expected Time Value got: 'asdf'"]}
  end

  it "good data should not have validation errors" do
    good_data.valid?.should == true
    good_data.errors.messages.should == {}
  end

  it "blank data should not have validation errors" do
    blank_data.valid?.should == true
    blank_data.errors.messages.should == {}
  end

end
 
