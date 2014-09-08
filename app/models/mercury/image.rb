class Mercury::Image < ActiveRecord::Base

  self.table_name = :mercury_images

  has_attached_file :image, :styles => lambda { |image| { :resized => image.instance.size } }
  validates_attachment_content_type :image, :content_type => %w(image/jpeg image/jpg image/png image/gif)

  attr_accessor :size

  def serializable_hash(options = nil)
    options ||= {}
    options[:methods] ||= []
    options[:methods] << :url
    super(options)
  end

  def url
    self.image(:resized)
  end

end