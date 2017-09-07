require 'rails_helper'

RSpec.describe MyEmail, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it{ should validate_presence_of(:email).with_message("Woops! Parece que olvidaste colocar el correo.") }
  
  it{ should validate_uniqueness_of(:email).with_message("Este correo ya fue registrado.") }

  it "should not create with invalid email" do
    email = MyEmail.new(email:"carlos")
    expect(email.valid?).to be_falsy
  end

  it "should not create with invalid email" do
    email = MyEmail.new(email:"carlos@xd.com")
    expect(email.valid?).to be_truthy
  end  
end
