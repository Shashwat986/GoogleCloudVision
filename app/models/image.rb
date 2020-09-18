class Image < ApplicationRecord
  has_one_attached :image
  serialize :tags, JSON

  def image_path
    ActiveStorage::Blob.service.path_for(self.image.key)
  end

  def process_tags
    response = $GCV.label_detection image: self.image_path

    i_tags = response.responses.map { |r| r.label_annotations.map(&:description) }.flatten

    self.tags = i_tags
    self.save
  end
end
