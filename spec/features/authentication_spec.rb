require "rails_helper"

feature "Authentication" do
  scenario "User can sign in" do
    visit "/"

    click_link "Register"

    fill_in "Username", with: "judgedredd"
    fill_in "Email", with: "dredd@megacity.example.com"
    click_button "Register"

    expect(page).to have_content "Password can't be blank"

    fill_in "Username", with: "judgedredd"
    fill_in "Email", with: "dredd@megacity.example.com"
    fill_in "Password", with: "pazzword"
    click_button "Register"

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
