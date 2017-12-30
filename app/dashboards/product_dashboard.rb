require "administrate/base_dashboard"

class ProductDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    description: Field::Text,
    price: PriceField,
    stock_quantity: Field::Number,
    images: Field::Carrierwave.with_options(
      image: :standard,
      multiple: true,
      image_on_index: true,
    ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    name
    stock_quantity
    price
  ].freeze

  SHOW_PAGE_ATTRIBUTES = %i[
    id
    description
    price
    stock_quantity
    images
  ].freeze

  FORM_ATTRIBUTES = %i[
    name
    description
    price
    stock_quantity
    images
  ].freeze

  def display_resource(product)
    product.name.to_s
  end

  def permitted_attributes
    super - [:images] + [{ images: [] }]
  end
end
