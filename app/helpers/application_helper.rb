module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end


  def project_avatar(project, size=220)
        if project.avatar.attached?
            project.avatar.variant(resize: "244.516x200!")
        end
    end
end
