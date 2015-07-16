require 'test_helper'
require 'rails/performance_test_help'

class HomepageTest < ActionDispatch::PerformanceTest
  # Refer to the documentation for all available options
   #self.profile_options = { runs: 5, metrics: [:wall_time, :memory],
     #                      output: 'tmp/performance', formats: [:flat] }

  test "homepage" do
    get '/'

    #login as admin
    get "/profile/users/sign_in"
    @admin1 = User.create(email: "admin1@gmail.com", password: "helloworld", admin: true)
    post_via_redirect "/profile/users/sign_in",
    {user: {email: @admin1.email, password: @admin1.password}}

    #edit alumni
    get "/alums/new"


  end
end
