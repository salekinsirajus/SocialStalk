json.array! @notifications do |notification|
  json.id notification.id
  #json.unread !notification.read_at?

  json.recipient notification.recipient.name
  json.actor notification.actor.name
  json.action notification.action
  #json.notifiable notification.notifiable
  json.url notification.url
end