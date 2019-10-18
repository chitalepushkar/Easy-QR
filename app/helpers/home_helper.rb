module HomeHelper

  def read_svg(file_path)
    return File.read(file_path).html_safe if File.exists?(file_path)
    '(not found)'
  end

 def active_class(link_path)
  current_page?(action: link_path) ? "active" : ""
 end
end
