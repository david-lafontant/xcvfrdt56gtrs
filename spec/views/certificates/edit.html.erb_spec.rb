require 'rails_helper'

RSpec.describe "certificates/edit", type: :view do
  let(:certificate) {
    Certificate.create!(
      first_name: "MyString",
      last_name: "MyString",
      company: "MyString",
      certificate_id: "MyString",
      documents: nil,
      operator: nil,
      description: "MyText"
    )
  }

  before(:each) do
    assign(:certificate, certificate)
  end

  it "renders the edit certificate form" do
    render

    assert_select "form[action=?][method=?]", certificate_path(certificate), "post" do

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
