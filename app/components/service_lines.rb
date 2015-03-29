class ServiceLines < MasterGrid
  def configure(c)
    super
    c.title = I18n.t(:equipment_service)
    c.model = "ServiceLine"
    c.columns = [
        { name: :service__name, header: I18n.t(:Service), flex: 1 },
        { name: :service_date, header: I18n.t(:service_date), flex: 1 },
        { name: :notes, header: I18n.t(:notes) }
    ]
  end

  def default_fields_for_forms
    [
        { name: :service__name, field_label: I18n.t(:Service) },
        { name: :service_date, field_label: I18n.t(:service_date) },
        { name: :notes, field_label: I18n.t(:notes) }
    ]
  end
end