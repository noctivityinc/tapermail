module ApplicationHelper

  def alert_css(alert_type)
    case alert_type.to_s
    when 'success'
      'success'
    when 'notice'
      'info'
    when 'warning'
      'warning'
    when 'error'
      'danger'
    end
  end
end
