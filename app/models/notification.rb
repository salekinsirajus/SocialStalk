class Notification < ActiveRecord::Base
    belongs_to :recipient, class_name: "User"
    belongs_to :actor, class_name: "User"
    belongs_to :notifiable, polymorphic: true
    
    scope :unread, ->{ where(read_at: nil) }
    scope :recent, ->{ where("created_at >= ? AND created_at <= ?", 3.days.ago, Time.zone.now) and order(created_at: :desc)}

end
