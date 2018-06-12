class Shipment < ApplicationRecord
  paginates_per 4

  belongs_to :company
  has_many :shipment_products

  scope :by_mode, -> (mode) { where("international_transportation_mode = ?", mode) }

  def as_json(a = {})
    {
      id: self.id,
      name: self.name,
      created_at: self.created_at,
      products: self.shipment_products.map {|a|
         {
           id: a.product.id,
           sku: a.product.sku,
           description: a.product.description,
           quantity: a.quantity,
           active_shipment_count: a.product.id
         }
        }
    }
  end
  
  def active_shipment_count
    self.shipment_products.count
  end
end
