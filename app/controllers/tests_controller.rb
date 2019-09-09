class TestsController < ApplicationController

  def index
    render json: { tests: Test.all }
  end

  def show
    # byebug
    # render inline: '<%= Test.first.title %>'
    # render json: { tests: Test.tests_array_show('rails') }
    render json: { questions_for_test: Test.find(1).questions }
  end
end
