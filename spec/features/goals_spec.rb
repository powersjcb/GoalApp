require 'rails_helper'
include Helpers

before :each do
  user = create(:user)
  other_user = create(:user, username: "Ned")
end

feature "show goals user show page" do

  it "has a goal page" do
    login(user)

    visit(user_url(user))
    expect(page).to have_content("#{user.username} Profile")
  end

  it "renders new goal on the page" do

    login(user)

    fill_in("Title", with: "Lose 10lbs")
    fill_in("Body", with: "Lose 10 lbs by Memorial Day")
    fill_in("Date", with: "05/25/2015")
    click_button("Create Goal")

    expect(page).to have_content("Lose 10lbs")
  end

  it "only allows valid goals" do
    login(user)

    click_button("Create Goal")

    expect(page).to have_content("Title can't be blank")
  end

  it "doesn't show private goals for users other than self" do
    create(:goal, user_id: user.id)

    login(other_user)
    visit(user_url(user))

    expect(page).to_not have_content("Lose 10lbs")
  end

  it "shows public goals for other users" do
    create(:goal, visible: true, user_id: user.id)

    login(other_user)
    visit(user_url(user))

    expect(page).to have_content("Gain 10lbs")
  end

  it "shows private and public for self" do
    create(:goal, title: "Gain 10lbs", body:"Gain 10 lbs by Memorial Day",
         visible: true, user_id: user.id)
    create(:goal, user_id: user.id)

    login(user)
    visit(user_url(user))

    expect(page).to have_content("Gain 10lbs")
    expect(page).to have_content("Lose 10lbs")
  end
end

feature "goals index" do

  it "displays many public goals" do
    create(:goal, title: "Goal 1", visible: true, user_id: user.id)
    create(:goal, title: "Goal 2", visible: true, user_id: other_user.id)
    login_in(user)

    visit(goals_url)

    expect(page).to have_content("Goal 1")
    expect(page).to have_content("Goal 2")
  end

  # it "is sorted by target date" do
  #
  # end
  #
  # it "shows recently met goals" do
  #
  # end

  # it "has create public goal form" do
  #
  # end

end
