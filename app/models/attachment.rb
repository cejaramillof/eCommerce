class Attachment < ActiveRecord::Base
  belongs_to :product
  validates :archivo, attachment_presence: true
  has_attached_file :archivo, path: ":rails_root/archivos/:id/:style/:filename"
  do_not_validate_attachment_file_type :archivo #Necesita cambiarse
end
