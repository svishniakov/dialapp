{
    initComponent: function(){
        this.callParent();

        var view = this.getComponent('equipments').getView();

        view.on('itemclick', function(view, record){
            this.selectEquipment({equipment_id: record.get('id')});
                this.getComponent('service_lines').getStore().load();
                this.getComponent('service_lines').enable();
        }, this)
    }
}