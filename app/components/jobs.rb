class Jobs < MasterGrid
  def configure(c)
    super
    c.title = I18n.t(:jobs)
    c.model = "Job"
    c.columns = [
        { name: :procedure__name, header: I18n.t(:Procedure) },
        { name: :qty, header: I18n.t(:qty) },
        { name: :start_date, header: I18n.t(:start_date), format: 'd-m-Y' },
        { name: :end_date, header: I18n.t(:end_date), format: 'd-m-Y' },
        { name: :notes, header: I18n.t(:notes), flex: 1}
    ]
  end

  def default_fields_for_forms
    [
        { name: :procedure__name, field_label: I18n.t(:Procedure) },
        { name: :qty, field_label: I18n.t(:qty), hide_trigger: true },
        { name: :start_date, field_label: I18n.t(:start_date), format: 'd-m-Y' },
        { name: :end_date, field_label: I18n.t(:end_date), format: 'd-m-Y' },
        { name: :notes, field_label: I18n.t(:notes) }
    ]
  end
end