require 'rails_helper'

describe Contact do
  it "is valid with a firstname, lastname and email" do 
    contact = Contact.new(
      firstname: 'Faraaz',
      lastname: 'Nishtar',
      email: 'faraaznishtar@gmail.com')
    expect(contact).to be_valid 
  end

  it "is invalid without a firstname" do
    contact = Contact.new(firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without a lastname" do
    contact = Contact.new(lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    contact = Contact.new(email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do 
    Contact.create(firstname: 'vince', lastname: 'perez', email: 'fnishtar@apple.com')
    contact = Contact.new(firstname: 'vince', lastname: 'perez', email: 'fnishtar@apple.com')
    
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it "returns a contact's full name as a string" do
    contact = Contact.new(
      firstname: 'Faraaz',
      lastname: 'Nishtar',
      email: 'faraaznishtar@gmail.com')
    expect(contact.name).to be_a(String)
  end
end