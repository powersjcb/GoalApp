module ApplicationHelper

  def render_auth_token
    <<-HTMLERB
    <input
      type=\"hidden\"
      name=\"authenticity_token\"
      value=\"#{form_authenticity_token}\">
    HTMLERB
      .html_safe
  end

  def flash_errors
    str = ""
    if flash[:errors]
      flash[:errors].each  do |error|
        str << "<li>#{error}</li>"
      end
    end

    "<ul>#{str}</ul>".html_safe
  end

end
