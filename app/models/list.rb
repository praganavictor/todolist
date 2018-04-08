class List < ApplicationRecord
	has_many :tasks

	belongs_to :user

	validates :name, presence: true

	enum status: [ :publish, :privating ]

	accepts_nested_attributes_for :tasks
end


