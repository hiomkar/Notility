require 'spec_helper'

describe Course do

  subject { @course }

  before do
    @course = Course.new(name: "Course")
  end

  describe "note model and associations" do

    before { @course.save }
    let!(:older_note) do
      FactoryGirl.create(:note, course: @course, created_at: 1.day.ago)
    end
    let!(:newer_note) do
      FactoryGirl.create(:note, course: @course, created_at: 1.hour.ago)
    end

    it "should increase model count when new note is created" do
      #two notes created earlier
      FactoryGirl.create(:note, course: @course, created_at: 1.hour.ago)
      FactoryGirl.create(:note, course: @course, created_at: 1.hour.ago)
      #now added 2 more, so total 4 notes exist in the model
      Note.count.should == 4
    end

    it "should have the right notes in the right order" do
      @course.notes.should == [newer_note, older_note]
    end

    it "should be associated to a course" do
      FactoryGirl.build(:note, :course_id => nil).should_not be_valid
    end

    it "should be associated to a course" do
      FactoryGirl.build(:note, :course_id => '1').should be_valid
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
