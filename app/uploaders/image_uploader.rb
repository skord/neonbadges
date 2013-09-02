# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  unless Rails.env == 'production'
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fill => [200,200]

  version :thumbnail do
    process :resize_to_fill => [50,50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
