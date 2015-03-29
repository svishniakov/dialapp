class Application < Netzke::Basepack::Viewport

  js_configure do |c|
    c.layout = :fit
    c.mixin
  end

  def configure(c)
    super
    c.items = [
        { layout: :border,
          items: [
              {
                  region: :west,
                  item_id: :navigation,
                  width: 200,
                  split: true,
                  xtype: :treepanel,
                  root: menu,
                  root_visible: false,
                  title: 'Main panel',
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
                  html: '<h4 align="center">DialApp</h4>'
              }
          ]
        }
    ]
  end

  protected

  def leaf(text, component, icon = nil)
    { text: text,
      icon: icon && uri_to_icon(icon),
      cmp: component,
      leaf: true,
      with_icons: true
    }
  end

  def menu
    out = { :text => 'Main menu',
            :expanded => true,
            :children => [
                # leaf('Document Statuses', :DocStatuses )
            ]}
  end

  #
  # References
  #
  # component :currencies

end