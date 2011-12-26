module ControllerMacros
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def it_should_require_admin_for_actions(*actions)
      actions.each do |action|
        it "#{action} action should require admin" do
          get action, :id => 1
          response.should redirect_to(login_url)
          flash[:error].should == "You must first log in or sign up before accessing this page."
        end
      end
    end
  end
end