module ApplicationHelper

  def clean_alert(alert)
    if alert.is_a?(Array)
      alert = alert.join(". ")
      alert = alert + "." if alert[-1] != "."
    else
      alert = alert + "." if alert[-1] != "."
    end

    alert
  end
    
end
