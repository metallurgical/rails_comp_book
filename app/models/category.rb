class Category < ActiveRecord::Base
	has_many :products, dependent: :destroy
	# accept nested attributetes for products field
	# if product name field on add new category form is empty
	# then never accept this nested features and just accept the category field only(default)
	accepts_nested_attributes_for :products, reject_if: lambda { |attr| attr[:pname].blank? }
end
