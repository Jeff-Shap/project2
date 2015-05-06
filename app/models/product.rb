class Product < ActiveRecord::Base

	has_many :reviews
	belongs_to :category
	
	validates :name, :description, presence: true
	validates :price_in_cents, numericality: {only_integer: true, greater_than: 0}

	def formatted_price
		sprintf("%.2f", price_in_dollars)
	end

	def price_in_dollars=(dollars)
		self.price_in_cents=(dollars.to_f*100).to_i
	end

	def price_in_dollars
		return nil if price_in_cents.nil?
		price_in_cents/100.0
	end
end
