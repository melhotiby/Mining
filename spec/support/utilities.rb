def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
end

def non_valid_signin
  click_button "Sign in"
end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def sign_out(user)
  visit destroy_user_session_path
end

RSpec::Matchers.define :have_notice_message do |message|
  match do |page|
    page.should have_selector('div.flash.notice', text: message)
  end
end