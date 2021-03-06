require 'rails_helper'

RSpec.describe "locations/index", :type => :view do
  before(:each) do
    assign(:locations, [
      Location.create!(
        :code => "Code",
        :name => "Name"
      ),
      Location.create!(
        :code => "Code",
        :name => "Name"
      )
    ])
  end

  it "renders a list of locations" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
