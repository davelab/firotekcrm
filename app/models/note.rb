class Note < ActiveRecord::Base
  attr_accessible :body, :company_id
  belongs_to :company

  validates :body, presence: {message: "inserire una nota"}
end
