class Application < Netzke::Basepack::Viewport

  js_configure do |c|
    c.layout = :fit
    c.mixin
  end

  def configure(c)
    current_user = Netzke::Base.controller.current_user
    @user = current_user.name.nil? ? current_user.email : current_user.name

    if current_user.active? && current_user.admin?
      menu = menu_admin
    elsif current_user.active?
      menu = menu_user
    else
      menu = menu_empty
    end

    super
    c.items = [
        { layout: :border,
          items: [
              {
                  region: :west,
                  item_id: :navigation,
                  width: 300,
                  split: true,
                  xtype: :treepanel,
                  root: menu,
                  root_visible: false,
                  title: I18n.t(:main_menu),
                  collapsible: true
              },
              {
                  region: :center,
                  xtype: :panel,
                  item_id: :main_panel,
                  layout: :fit,
                  split: true,
                  border: false
              },
              {
                  region: :north,
                  xtype: :panel,
                  item_id: :header,
                  height: 40,
                  frame: true,
                  html: header_html
              }
          ]
        }
    ]
  end

  protected

  def header_html
    %Q{
      <div class="row padding">
        <div class="col-md-1 center header bold">Dial App</div>
        <div class="col-md-5 right header">#{@user}</div>
        <div class="col-md-5 left header">#{Time.zone.now}</div>
        <div class="col-md-1 center header"><a href="/users/sign_out">Logout</a></li></div>
      </div>

    }
  end


  def leaf(text, component, icon = nil)
    { text: text,
      icon: icon && uri_to_icon(icon),
      cmp: component,
      leaf: true,
      with_icons: true
    }
  end

  def menu_admin
    out = { :text => I18n.t(:main_menu),
            :expanded => true,
            :children => [
                {
                    :text => I18n.t(:company_settings),
                    :expanded => true,
                    :children => [
                        leaf(I18n.t(:branches), :Branches, :house),
                        leaf(I18n.t(:procedures), :Procedures, :heart)
                    ]
                },
                {
                    :text => I18n.t(:system),
                    :expanded => true,
                    :children => [
                        leaf(I18n.t(:users), :Users, :group)
                    ]
                }
            ]

            }
  end

  def menu_user
    out = { :text => I18n.t(:main_menu),
            :expanded => true,
            :children => [
                {
                    :text => I18n.t(:equipment),
                    :expanded => true,
                    :children => [
                        # leaf(I18n.t(:users), :Users, :group)
                    ]
                }
            ]

    }
  end


  def menu_empty
    out = { :text => I18n.t(:main_menu),
            :expanded => true,
            :children => [
                {
                    :text => I18n.t(:contact_admin)
                }
            ]
    }
  end

  #
  # References
  #
  component :users
  component :branches
  component :procedures

end