require 'rails_helper'

RSpec.describe "notes/edit", :type => :view do
  before(:each) do
    @note = assign(:note, Note.create!(
      :title => "MyString",
      :text => "MyText",
      :notbook => nil
    ))
  end

  it "renders the edit note form" do
    render

    assert_select "form[action=?][method=?]", note_path(@note), "post" do

      assert_select "input#note_title[name=?]", "note[title]"

      assert_select "textarea#note_text[name=?]", "note[text]"

      assert_select "input#note_notbook_id[name=?]", "note[notbook_id]"
    end
  end
end
