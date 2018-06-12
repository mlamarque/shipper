class Company < ApplicationRecord
  has_many :shipments

  def shipments_as_json(option)
    option = {sort: "id", direction: "asc", page: 1, per: 4}.merge(option)
    _shipments = Shipment
    _shipments = self.shipments
    _shipments = _shipments.by_mode(option[:mode]) if option[:mode].present?
    _shipments = _shipments.order("#{option[:sort]} #{option[:direction]}").page(option[:page]).per(option[:per])
    _shipments.map(&:as_json)
  end
    
end
