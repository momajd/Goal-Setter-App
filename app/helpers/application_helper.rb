module ApplicationHelper

  def auth_token
    "<input
    type='hidden'
    name='authenticity_token'
    value='#{form_authenticity_token}'>".html_safe
  end

  def privacy_checked(goal, value)
    if (goal.privacy.nil? && value == "Private") || goal.privacy == value
      "checked"
    else
      nil
    end
  end
end
