class WelcomeController < ApplicationController
    before_action :authentication_required
    
    def show
    end
end
