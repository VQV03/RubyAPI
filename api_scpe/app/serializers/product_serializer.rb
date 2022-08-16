class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :quantity_in_stock, :price, :highlight, :image, :category_name, :unit_name
  
  belongs_to :category, optional: true, serializer: CategorySerializer
  belongs_to :unit, optional: true, serializer: UnitSerializer

  def category_name
    object.category do |cc|
      {
        name: cc.name
      }
    end
  end

  def unit_name
    object.unit do |uc|
      {
        name: uc.name
      }
    end
  end

  # def should_render_category
  #   @instance_options[:show_category]
  # end
  # def should_render_unit
  #   @instance_options[:show_unit]
  # end
end
