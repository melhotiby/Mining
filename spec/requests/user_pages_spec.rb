require 'spec_helper'

describe "User pages" do
  subject { page }
  
  describe "signup page" do
    let(:user) { FactoryGirl.create(:user) }
    before do 
      visit new_user_session_path 
      valid_signin(user)
    end
    describe "with valid information" do
      it {should have_notice_message('Successfully') }
    end
  end
  
  describe "Lead Form page" do
    describe "without logging in" do
      before { visit lead_form_path }
      specify { response.should redirect_to(new_user_session_path) }
    end
  end
  
end
