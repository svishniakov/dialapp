class Equipments < MasterGrid
  def configure(c)
    super
    c.title = I18n.t(:equipment)
    c.model = "Equipment"
    c.columns = [
        { name: :name, header: I18n.t(:title), flex: 1 },
        { name: :serial, header: I18n.t(:serial), flex: 1 },
        { name: :commissioning, header: I18n.t(:commissioning), flex: 1 },
        { name: :notes, header: I18n.t(:notes), flex: 1 }
    ]
  end

  def default_fields_for_forms
    [
        { name: :name, field_label: I18n.t(:title) },
        { name: :serial, field_label: I18n.t(:serial) },
        { name: :commissioning, field_label: I18n.t(:commissioning) },
        { name: :notes, field_label: I18n.t(:notes) }
    ]
  end
end