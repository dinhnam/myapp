class Feature < ApplicationRecord
  mount_uploaders :pictures, PicturesUploader
end
