module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Jeremic Marketplace").join(" - ")
      end
    end
  end
end
