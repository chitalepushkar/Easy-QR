module HomeHelper

  def read_svg(file_path)
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end
end
