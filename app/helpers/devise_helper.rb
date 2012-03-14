module DeviseHelper
  def devise_error_messages!
    resource.errors.full_messages.map do |msg|
      content_tag :div, :class => "flash alert" do 
        content_tag(:span, msg) 
      end
    end.join.html_safe
  end
end
