require 'spec_helper'

describe "Reviews routing" do 
  
  it "matches GET /reviews/new to reviews#new" do
    {get: "/reviews/new"}.should route_to(controller: 'reviews', action: 'new')
  end

end