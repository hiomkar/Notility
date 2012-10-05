class NotesController < ApplicationController
  # GET /notes
  # GET /notes.json

  respond_to :html, :json, :xml

  skip_before_filter  :verify_authenticity_token

  def index
    #@notes = Note.all
    @notes = Note.search(params[:search])

=begin
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notes }
      format.xml { render xml: @notes }
    end
=end

  end

  def get_note
    @notes = Note.search(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @notes }
    end
  end


  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.find(params[:id])
    respond_with @note
  end

  # GET /notes/new
  # GET /notes/new.json
  def new
    @note = Note.new
    respond_with @note
  end

  # GET /notes/1/edit
  def edit
    @note = Note.find(params[:id])
    respond_with @note
  end

  # POST /notes
  # POST /notes.json
  # POST /notes.xml

  def create
    @note = Note.new(params[:note])

=begin
    $ curl -H 'Content-Type: application/xml'   -X POST -d '<?xml version="1.0" encoding="UTF-8"?>
<note>
  <content>note from api 2</content>
  <course_id>2</course_id>
  <tag>api</tag>
</note> http://notility.herokuapp.com/notes
=end

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
        format.json { render json: @note, status: :created, location: @note }
        format.xml { render :xml => @note }
      else
        format.html { render action: "new" }
        format.xml { render :xml => "Failed"}
        flash[:notice] = "Failed to save."
      end
    end
  end

  # PUT /notes/1
  # PUT /notes/1.json
  def update
    @note = Note.find(params[:id])

    respond_to do |format|
      if @note.update_attributes(params[:note])
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

end

