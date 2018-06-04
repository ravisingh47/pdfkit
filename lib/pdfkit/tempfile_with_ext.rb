require 'tempfile'

class TempfileWithExt < Tempfile
  # Replaces Tempfile's +make_tmpname+ with one that honors file extensions.
  def make_tmpname(basename, n)
    extension = File.extname(basename)
    sprintf("%s_%d_%d%s", File.basename(basename, extension), $$, n, extension)
  end

  def self.string_to_file(string, filename='foo', temp_path)
    path = nil

    File.open(temp_path + filename, 'w+') do |f|
      f.write string
      path = f.path
    end
    path
  end
end
