require 'rails_helper'
include Helpers

feature "the signup process" do

  it "has a new user page" do
    visit('users/new')
    expect(page).to have_content('Sign Up')
  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      visit(new_user_path)
      fill_in("Username", with: "jacob")
      fill_in("Password", with: "foobar")
      click_button("Sign Up")
      expect(current_path).to match(root_path)
      expect(page).to have_content("jacob")
    end

  end

end

feature "logging in" do

  it "shows username on the homepage after login" do
    user = create(:user)
    login(user)
    expect(current_path).to match(root_path)
    expect(page).to have_content(user.username)
  end

end

feature "logging out" do

  it "begins with logged out state" do
    visit(goals_path)
    expect(page).to have_content("Sign In")
    expect(current_path).to match(new_session_path)
  end

  it "doesn't show username on the homepage after logout" do
    user = create(:user)
    login(user)

    click_link('Log Out')
    visit(root_path)

    expect(page).to_not have_content(user.username)
  end

end
