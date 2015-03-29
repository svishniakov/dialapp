class Branches < MasterGrid
  def configure(c)
    super
    c.title = I18n.t(:branches)
    c.model = "Branch"
    c.columns = [
        { name: :name, header: I18n.t(:title), flex: 1 },
        { name: :address, header: I18n.t(:address), flex: 1},
        { name: :notes, header: I18n.t(:notes), flex: 1}
    ]
  end

  def default_fields_for_forms
    [
        { name: :name, field_label: I18n.t(:title) },
        { name: :address, field_label: I18n.t(:address) },
        { name: :notes, field_label: I18n.t(:notes) }
    ]
  end
end