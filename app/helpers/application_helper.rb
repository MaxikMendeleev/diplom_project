module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "HRMSupProgramm"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def is_admin?(user)
    user.admin
  end
end
