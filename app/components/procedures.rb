class Procedures < MasterGrid
  def configure(c)
    super
    c.title = I18n.t(:procedures)
    c.model = "Procedure"
    c.columns = [
        { name: :name, header: I18n.t(:title)},
        { name: :notes, header: I18n.t(:notes), flex: 1}
    ]
  end

  def default_fields_for_forms
    [
        { name: :name, field_label: I18n.t(:title)},
        { name: :notes, field_label: I18n.t(:notes)}
    ]
  end
end