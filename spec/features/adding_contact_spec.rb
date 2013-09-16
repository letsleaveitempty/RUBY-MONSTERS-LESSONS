require 'spec_helper'

# NOTE: always use js: true for integration/feature tests
# feature keyword is just to wrap up together the whole set of things we 
# test - usually the particual featyre of an application
feature 'Contacts management', js: true do

  describe "edit contact" do
    scenario 'see updated first_name' do
      Contact.create!(first_name:'Anita')
      Contact.update(first_name:'Anitka')

      visit contacts_path

      expect(page).to have_content "Anitka"
    end
  end

  describe "removal" do
    scenario 'see list without removed contact' do
      Contact.create!(first_name:'Anita')
      Contact.create!(first_name:'Anna')
      Contact.delete(1)

      visit contacts_path

      expect(Contact.count).to be(1)
    end
  end

  describe 'listing contacts' do
    scenario 'see 3 contacts' do
      Contact.create!(first_name:"Luki")
      Contact.create!(first_name:"Lucas")
      Contact.create!(first_name:"Lukasz")

      visit contacts_path # /contacts

      expect(page).to have_content "Luki"
      expect(page).to have_content "Lucas"
      expect(page).to have_content "Lukasz"
    end
  end

  # describe is just narrowing down to particular scopes
  describe 'adding new' do
    # is equivalen of 'it' keyword and means a particual test
    scenario 'navigating to form for adding user by url' do
      visit '/contacts/new'
      expect(page).to have_content 'Adding Contact'
    end

    scenario 'navigating to form for adding user by routes-helper' do
      visit new_contact_path
      expect(page).to have_content 'Adding Contact'
    end

    scenario 'creating new contact adds new contact to DB' do 
      visit new_contact_path
      fill_in 'contact_first_name', with: "Lukasz"
      fill_in 'contact_last_name',  with: "Lazewski"

      expect(Contact.count).to be(0) # before creating
      click_button 'send that puppy over'
      expect(Contact.count).to be(1) # after creating
    end

    scenario 'adds new contact to DB' do 
      visit new_contact_path
      fill_in 'contact_first_name', with: "Lukasz"
      fill_in 'contact_last_name',  with: "Lazewski"

      click_button 'send that puppy over'
      expect(Contact.first.first_name).to eq("Lukasz")
      expect(Contact.first.last_name).to  eq("Lazewski")
    end

    scenario 'creating new contact redirects' do 
      visit new_contact_path
      fill_in 'contact_first_name', with: "Lukasz"
      fill_in 'contact_last_name',  with: "Lazewski"

      click_button 'send that puppy over'

      # after succesfuly adding we expect redirect to happen to list
      expect(current_path).to eq(contacts_path)
    end
  end


end
