require 'spec_helper'

describe Course do

  subject { @course }

  before do
    @course = Course.new(name: "Course")
  end

  describe "note associations" do

    before { @course.save }
    let!(:older_note) do
      FactoryGirl.create(:note, course: @course, created_at: 1.day.ago)
    end
    let!(:newer_note) do
      FactoryGirl.create(:note, course: @course, created_at: 1.hour.ago)
    end

    it "should have the right notes in the right order" do
      @course.notes.should == [newer_note, older_note]
    end
  end

  describe "destroy dependencies" do

    it "should destroy all notes when a course is destroyed" do
      @course = Course.create(:name => "OS")
      @note = Note.create(:content => "test note", :course_id => @course.id)

      @course.notes << @note
      @course.destroy

      Note.find_by_course_id(@course.id).should == nil
    end

  end

end
