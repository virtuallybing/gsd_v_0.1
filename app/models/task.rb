class Task < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :user
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :tags
  validates :title, :presence => true
  scope :completed_today, where("complete < ? AND complete > ?", Time.now.end_of_day(), Time.now.beginning_of_day()).order("complete")
  scope :overdue, where("complete IS NULL AND due < ?", Time.now).order("due")
  scope :due_today, where("complete IS NULL AND due <= ? AND due >= ?", Time.now.end_of_day, Time.now).order("due")
  scope :no_due_date, where("complete IS NULL AND due IS NULL").order("created_at")
  scope :due_beyond_today, where("complete IS NULL AND due >= ?", Time.now.end_of_day()).order("due")
  scope :pending, where("complete is NULL").order("due")
end
