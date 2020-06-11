class Bill < ActiveRecord::Base
    validates :name, :monthly_payment, :due_date, :user_id, presence: true
    belongs_to :user
end