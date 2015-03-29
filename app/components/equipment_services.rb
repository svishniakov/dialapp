class EquipmentServices < Netzke::Base
  include Netzke::Basepack::ItemPersistence

  def configure (c)
    super
    c.items = [
        {
            netzke_component: :equipments,
            region: :north,
            height: 300
        },
        {
            netzke_component: :service_lines,
            region: :center,
            flex: 1
        }
    ]
  end

  js_configure do |c|
    c.layout = :border
    c.border = false
    c.mixin
  end

  endpoint :select_equipment do |params, this|
    component_session[:selected_equipment_id] = params[:equipment_id]
  end

  component :equipments

  component :service_lines do |c|
    c.klass = ServiceLines
    c.disabled = true
    c.data_store = {auto_load: false}
    c.scope = {:equipment_id => component_session[:selected_equipment_id]}
    c.strong_default_attrs = {:equipment_id => component_session[:selected_equipment_id]}
  end

end