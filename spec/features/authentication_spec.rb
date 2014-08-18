require "rails_helper"

feature "Authentication" do
  before do
    create_user(
      username: "judgedredd",
      password: "pazzword",
      password_confirmation: "pazzword"
    )
  end

  scenario "User can sign in" do
    visit "/"

    click_button "Sign In"
    expect(page).to have_content "Username / password is invalid"
    
    fill_in "Username", with: "judgedredd"
    fill_in "Password", with: "wrong"
    click_button "Sign In"
    
    expect(page).to have_content "Username / password is invalid"
    
    fill_in "Username", with: "judgedredd"
    fill_in "Password", with: "pazzword"
    click_button "Sign In"

    expect(page).to have_content "Welcome judgedredd"
  end
end
