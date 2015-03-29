class Users < Netzke::Basepack::Grid

  # column :role do |c|
  #   c.editor = {
  #       trigger_action: :all,
  #       xtype: :combo,
  #       store: [[1, "Admin"], [2, "Translator Allods"], [3, "Read only"], [4, "Translator Skyforge"], [5, "Translator Allods+Skyforge"]]
  #   }
  #   c.renderer = "function(v){return ['', 'Admin', 'Translator Allods', 'Read only', 'Translator Skyforge', 'Translator Allods+Skyforge'][v];}"
  # end

  def configure(c)
    c.title = "Users"
    c.model = "User"
    c.enable_edit_inline = false
    c.enable_edit_in_form = true
    c.context_menu = false
    c.columns = [
        { name: :name, header: I18n.t(:name),flex: 1 },
        { name: :email, flex: 1 },
        { name: :sign_in_count, header: I18n.t(:sign_in_count), flex: 1 },
        { name: :current_sign_in_at, header: I18n.t(:current_sign_in_at), flex: 1, format: 'd-m-Y' },
        { name: :current_ip, header: I18n.t(:current_sign_in_ip),flex: 1 },
        { name: :last_sign_in_at, header: I18n.t(:last_sign_in_at),flex: 1, format: 'd-m-Y' },
        { name: :last_ip, header: I18n.t(:last_sign_in_ip), flex: 1 },
        { name: :active, header: I18n.t(:active), flex: 1},
        { name: :admin, header: I18n.t(:admin), flex: 1 }
    ]
    c.bbar = [:edit]
  end

  def default_fields_for_forms
    [
        { name: :name,    field_label: I18n.t(:name)},
        { name: :email,   field_label: "Email" },
        { name: :active,  field_label: I18n.t(:active)},
        { name: :admin,   field_label: I18n.t(:admin)}
    ]
  end

  component :edit_window do |c|
    preconfigure_record_window(c)
    c.resizable = true
    c.width = 500
    c.title = I18n.t(:edit) + I18n.t(data_class)
    c.items = [:edit_form]
  end
end