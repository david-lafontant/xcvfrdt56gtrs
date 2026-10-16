require 'rails_helper'

RSpec.describe "certificates/index", type: :view do
  before(:each) do
    assign(:certificates, [
      Certificate.create!(
        first_name: "First Name",
        last_name: "Last Name",
        company: "Company",
        certificate_id: "Certificate",
        documents: nil,
        operator: nil,
        description: "MyText"
      ),
      Certificate.create!(
        first_name: "First Name",
        last_name: "Last Name",
        company: "Company",
        certificate_id: "Certificate",
        documents: nil,
        operator: nil,
        description: "MyText"
      )
    ])
  end

  it "renders a list of certificates" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("First Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Last Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Company".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Certificate".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
