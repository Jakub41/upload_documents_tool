require "upload_documents_tool/version"

module UploadDocumentsTool

  class Engine < ::Rails::Engine
  end

  def initialize(params = {})
    @file = params.delete(:file)
    super
    if @file
      self.filename = sanitize_filename(@file.original_filename)
      self.content_type = @file.content_type
      self.file_contents = @file.read
    end
  end

  def upload_local
    path = "#{Rails.root}/public/uploads/document"
    FileUtils.mkdir_p(path) unless File.exists?(path)
    FileUtils.copy(@file.tempfile, path)
  end

  private

  def sanitize_filename(filename)
    File.basename(filename)
  end

  def document_file_format
    unless ['application/pdf','application/vnd.ms-excel',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            'application/msword',
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document',
            'text/plain', 'text/csv', 'application/octet-stream'].include? self.content_type
      errors.add(:file, 'Invalid file format.')
    end
  end

  NUM_BYTES_IN_MEGABYTE = 1048576
  def file_size_under_one_mb
    if (@file.size.to_f / NUM_BYTES_IN_MEGABYTE) > 1
      errors.add(:file, 'File size cannot be over one megabyte.')
    end
  end


end
