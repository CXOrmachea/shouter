class PhotoShout < ActiveRecord::Base
  has_attached_file :image, styles: {
    index: "200x200>"
  }
end
