require 'rails_helper'

RSpec.describe "certificates/new", type: :view do
  before(:each) do
    assign(:certificate, Certificate.new(
      first_name: "MyString",
      last_name: "MyString",
      company: "MyString",
      certificate_id: "MyString",
      documents: nil,
      operator: nil,
      description: "MyText"
    ))
  end

  it "renders new certificate form" do
    render

    assert_select "form[action=?][method=?]", certificates_path, "post" do

      assert_select "input[name=?]", "certificate[first_name]"

      assert_select "input[name=?]", "certificate[last_name]"

      assert_select "input[name=?]", "certificate[company]"

      assert_select "input[name=?]", "certificate[certificate_id]"

      assert_select "input[name=?]", "certificate[documents]"

      assert_select "input[name=?]", "certificate[operator_id]"

      assert_select "textarea[name=?]", "certificate[description]"
    end
  end
end
