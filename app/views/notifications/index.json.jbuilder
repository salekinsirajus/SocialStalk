json.array! @notifications do |notification|
  json.id notification.id
  json.unread !notification.read_at?
  #json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]

  json.recipient notification.recipient.name
  json.actor notification.actor.name
  json.action notification.action
  json.notifiable notification.notifiable
    #json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase}"
  #end
  json.url notification.notifiable
  #json.url notification_path(notification.notifiable.user_id, anchor: dom_id(notification.notifiable))
end