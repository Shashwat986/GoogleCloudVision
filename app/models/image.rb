class Image < ApplicationRecord
  has_one_attached :image
  serialize :tags, JSON
  serialize :gcv_response, JSON

  def image_path
    ActiveStorage::Blob.service.path_for(self.image.key)
  end

  MATCH_SCORE_THRESHOLD = 0.5

  def process_tags
    response = $GCV.label_detection image: self.image_path

    i_tags = []
    i_metadata = []

    response.responses.each do |resp|
      resp.label_annotations.each do |lbl|
        i_metadata << JSON.parse(lbl.to_json)
        i_tags << lbl.description if lbl.score > MATCH_SCORE_THRESHOLD
      end
    end

    self.tags = i_tags
    self.gcv_response = i_metadata
    self.save
  end
end
