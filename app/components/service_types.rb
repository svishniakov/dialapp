class ServiceTypes < MasterGrid
  def configure(c)
    super
    c.title = I18n.t(:service_types)
    c.model = "Service"
    c.columns = [
        { name: :name, header: I18n.t(:title), flex: 1 },
        { name: :notes, header: I18n.t(:notes), flex: 1 }
    ]
  end

  def default_fields_for_forms
    [
        { name: :name, field_label: I18n.t(:title) },
        { name: :notes, field_label: I18n.t(:notes) }
    ]
  end
end