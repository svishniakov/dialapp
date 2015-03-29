{
    initComponent: function() {
        this.callParent();

        this.navigation = this.down('panel[itemId="navigation"]');
        this.mainPanel = this.down('panel[itemId="main_panel"]');
        this.header = this.down('panel[itemId="header"]');

        this.navigation.on('select', function(m, r) {
            this.netzkeLoadComponent(r.raw.cmp, {container: this.mainPanel, callback: function(cmp) {
                if (cmp.isFloating()) { cmp.show(); }
            }, scope: this});
        }, this);
    }
}