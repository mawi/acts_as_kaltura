class User < ActiveRecord::Base
  has_many :videos
end

class Video < ActiveRecord::Base
  belongs_to :user
  has_many :chapters
  acts_as_kaltura_video :delegate => [:thumbnail_url, :duration]

  def as_kaltura_entry
    Kaltura::MediaEntry.new.tap do |entry|
      entry.name        = title
      entry.description = description
      entry.media_type  = Kaltura::Constants::Media::Type::VIDEO
    end
  end
end

class Chapter < ActiveRecord::Base
  belongs_to :user
  belongs_to :video
  acts_as_kaltura_annotation

  def as_annotation_cuepoint
    ActsAsKaltura::Extension::KalturaAnnotation.new.tap do |cp|
      cp.cue_point_type = ActsAsKaltura::Extension::KalturaAnnotation::TYPE_ANNOTATION

      # convert to milliseconds
      cp.start_time     = self.start_time.to_i * 1000
      cp.end_time       = self.end_time.to_i * 1000

      cp.system_name = self.title
      cp.text        = self.description
      cp.entry_id    = self.video.kaltura_key
    end
  end
end
