class Icecream < ActiveRecord::Base

	has_many :sale_details

	has_attached_file :photo, styles: {full: "374×479", medium: "187x239"}

	validates_attachment :photo, presence: true

	validates_attachment_content_type :photo, content_type: ["image/jpeg", "image/gif", "image/png"]

	validates_attachment_file_name :photo, matches: [/png\Z/, /jpe?g\Z/]

	validates :flavor, presence: true, format: {with: /\A[A-Za-zÁÉÍÓÚáéíóúÑñ&™®\s]+\z/}

	validates :description, presence: true, format: {with: /\A[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+\z/}

	validates :price, presence: true, numericality: {greather_than: 0, less_than_or_equal_to: 150}

	validates :stock, presence: true, numericality: {greather_than_or_equal_to: 0, less_than_or_equal_to: 1000}

	def get_top_sellers
        sd = SaleDetail.order(:quantity).limit(5)
        ic = []
        
        sd.each do |detail|
            ic.push(Icecream.find(detail.icecream))
        end
   end
end
