class TestsController < ApplicationController
  # http://localhost:3000/tests
  def index
    render plain: Test.all.pluck(:title)
  end
end
