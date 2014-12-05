require 'rails_helper'

describe Contact do
  it "has a valid factory" do
    expect(build(:contact)).to be_valid
  end

  it "is valid with a firstname, lastname and email" do 
    expect(build(:contact)).to be_valid 
  end

  it "is invalid without a firstname" do
    contact = build(:contact, firstname: nil)
    contact.valid?
    expect(contact.errors[:firstname]).to include("can't be blank")
  end

  it "is invalid without a lastname" do
    contact = build(:contact, lastname: nil)
    contact.valid?
    expect(contact.errors[:lastname]).to include("can't be blank")
  end

  it "is invalid without an email address" do
    contact = build(:contact, email: nil)
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end

  it "returns a contact's full name as a string" do
    contact = build(:contact,
      firstname: 'Faraaz',
      lastname: 'Nishtar',
      email: 'faraaznishtar@gmail.com')
    expect(contact.name).to be_a(String)
  end

  it "is invalid with a duplicate email address" do 
    create(:contact, email: 'fnishtar@apple.com')
    contact = build(:contact, email: 'fnishtar@apple.com')
    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it "returns the contact's first and last name" do 
    contact = build(:contact, firstname: 'Nathik', 
      lastname: 'Salam', 
      email: 'nathiksalam@gmail.com')
    expect(contact.name).to eq('Nathik Salam')
  end

  it "has three phone numbers" do 
    expect(create(:contact).phones.count).to eq(3)
  end

=begin
 There is not functional difference between the describe block and the context block.
 There is only a contextual difference between the two. 
 The purpose of “describe” is to wrap a set of tests against one functionality 
 while “context” is to wrap a set of tests against one functionality under the same state.
=end

  describe "filter last name by letter" do #This describe block will test the functionality of being able to filter last name by letter
    before :each do # this block of code will exectute before each test within this describe block
      @smith = create(:contact, 
        firstname: 'John',
        lastname: 'Smith',
        email: 'jsmith@example.com'
      )
      @jones = create(:contact, 
        firstname: 'Tim',
        lastname: 'Jones',
        email: 'tjones@example.com'
      )
      @johnson = create(:contact, 
        firstname: 'John',
        lastname: 'Johnson',
        email: 'jjohnson@example.com'
      )
    end

    context "matching letters" do 
      it "returns a sorted array of results that match" do 
        expect(Contact.by_letter("J")).to eq [@johnson, @jones]
      end
    end

    context "non-matching letters" do
      it "omits the results that do not match" do
        expect(Contact.by_letter("J")).not_to include @smith
      end
    end 
  end
end