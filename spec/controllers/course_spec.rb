require 'spec_helper'

describe CoursesController do

  describe "course creation" do
    it "should create course" do
      assert_difference('Course.count') do
        post :create, :course => { :name => "ISE"}
      end
      assert_redirected_to course_path(assigns(:course))
    end
  end

end