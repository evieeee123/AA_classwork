require "action_view"

class Cat < ApplicationRecord
    ActionView::Helpers::DateHelper
    
    validates :color, inclusion: {in: %w(black orange red white green),
    message: "%{value} is not a valid color"}, presence: true
    validates :sex, inclusion: {in: %w(M F), 
    message: "%{value} is not a valid sex"}, presence: true
    validates :birth_date, :name, :description, presence: true
    
    def age
        Date.today.year - birth_date.year - 1
    end

end
