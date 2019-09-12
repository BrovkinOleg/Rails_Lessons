class TestsController < ApplicationController
  # http://localhost:3000/tests
  def index
    @tests = Test.all
    # render plain: Test.all.pluck(:title)
    render file: '../views/tests/index.html.erb', layout: false
  end
end
