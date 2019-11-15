module MessagesHelper
  STATUS_MAP = {
    'dropped' => 'danger',
    'deferred' => 'warning',
    'bounce' => 'danger',
    'open' => 'success',
    'delivered' => 'info'
  }

  def status_badge(status)
    class_name = "badge badge-#{STATUS_MAP[status] || 'primary'}"
    content_tag(:span, status, class: class_name)
  end
end
