class MasterGrid < Netzke::Basepack::Grid

  def configure(c)
    super
    c.enable_edit_inline = false
    c.enable_edit_in_form = true
    c.enable_add_in_form = true
    c.bbar = [:add, '-', :del]
  end

  component :add_window do |c|
    preconfigure_record_window(c)
    c.width = 500
    c.title = I18n.t(:add) + I18n.t(data_class)
    c.items = [:add_form]
    c.form_config.record = data_class.new(columns_default_values)
  end

  component :edit_window do |c|
    preconfigure_record_window(c)
    c.width = 500
    c.title = I18n.t(:edit) + I18n.t(data_class)
    c.items = [:edit_form]
  end

end
