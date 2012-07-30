require 'spec_helper'

describe Photo do
  it "should belong to relic and user" do
    build(:photo).should respond_to(:user)
    build(:photo).should respond_to(:relic)
  end

  it "should have working uploader on file attribute" do
    photo = create(:photo)
    photo.file = File.open(Rails.root + 'public/favicon.gif')
    photo.save!

    photo.file.should_not be_nil
    photo.file.url.should_not be_nil
    photo.file.current_path.should include(Rails.root)
    photo.file.identifier.should include('favicon')
  end
end
