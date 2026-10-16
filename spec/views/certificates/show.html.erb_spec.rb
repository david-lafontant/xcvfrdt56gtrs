require 'rails_helper'

RSpec.describe "certificates/show", type: :view do
  before(:each) do
    assign(:certificate, Certificate.create!(
      first_name: "First Name",
      last_name: "Last Name",
      company: "Company",
      certificate_id: "Certificate",
      documents: nil,
      operator: nil,
      description: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Certificate/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
