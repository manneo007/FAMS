<?php echo $this->renderElement('common_js_objects'); ?>

<script type="text/javascript" language="javascript">
/*
 * Grid Area
 */
var grid = null;
var current_row_index = 0;

var grid_data_store = null;

var tabs = null;

Ext.onReady(function() {
	
	// Sample data set, replaced with data from DB
	
	var divisionsReader = new Ext.data.ArrayReader({}, [
		{name: 'rec_id'},
		{name: 'division_code'},
		{name: 'division_description'}
	]);	
	
	grid_data_store =  new Ext.data.Store({
				reader: divisionsReader
			});

	divisions_json = Ext.util.JSON.decode('<?php echo $javascript->object($divisions_data); ?>');
	grid_data_store.loadData(divisions_json.divisions_data);

	grid = new Ext.grid.GridPanel({
			store: grid_data_store,
			columns: [
				{header: 'Division Code', width: 120, sortable: true, dataIndex: 'division_code'},
				{header: 'Description', width: 680, sortable: true, dataIndex: 'division_description'}
			],
			viewConfig: {
				forceFit: true,
			 	fitContainer: true
			},
			sm: new Ext.grid.RowSelectionModel({singleSelect: true}),
			renderTo: 'grid_area',
			title: 'Divisions',
			/*width: 700,*/
			height: 190,
			autoHeight: false,
			frame: true
	});
	
	if(Ext.isIE) {
		 grid.setWidth(700);
	}
	
	//grid.getSelectionModel().selectFirstRow();
	
	grid.getSelectionModel().on('rowselect', function(sm, row_index, r) {
		division_code.setValue(r.data['division_code']);
		division_description.setValue(r.data['division_description']);
		
		rec_id.setValue(r.data['rec_id'], true);
		current_row_index = row_index;
	});
	
	
});
</script>
<script type="text/javascript" language="javascript">
/*
 * Tab area
 */

Ext.onReady(function(){

    tabs = new Ext.TabPanel({
        renderTo: 'fields_div',
        id:'tab_panel',
        activeTab: 0,
        frame: true,
        deferredRender: false,
        defaults:{autoHeight: true},
        items:[
            {contentEl:'tab1', title: 'Division Details'}
        ],
        viewConfig: {
			forceFit: true,
		 	fitContainer: true
		},
		height: 240
    });

});
</script>
<script type="text/javascript" language="javascript">
/*
 * Form fields
 */

var division_code = null;
var division_description = null;

var rec_id = null;
var action = null;

var status_div = null;


Ext.onReady(function(){
    division_code = new Ext.form.TextField({
    			id: 'txt_division_code',
    			validateOnBlur: true,
    			invalidText: 'The value in this field is invalid',
    			maxLength : 5,
    			width: 200,
    			disabled: true,
    		    renderTo: 'cnt_division_code',
    		    msgTarget: 'under',
    		    allowBlank:false
    });

	division_description = new Ext.form.TextArea({
    			id: 'txt_description',
    			width: 600,
    			disabled: true,
    		    renderTo: 'cnt_description',
    		    allowBlank:false
    });

	rec_id = new Ext.form.Hidden({
    			id: 'hdn_rec_id',
    		    renderTo: 'cnt_hdn_rec_id'
    });
    
	action = new Ext.form.Hidden({
    			id: 'hdn_action',
    		    renderTo: 'cnt_hdn_action'
    });
    
	status_div = Ext.get('status_div');
	
});

</script>

<script type="text/javascript" language="javascript">
/*
 * Event handlers for buttons
 */

	function add() {
		
		// Enable/Disable fields accodingly
		clear();
		disable_fields(false);
		btn_add.setDisabled(true);
		btn_edit.setDisabled(true);
		btn_delete.setDisabled(true);
		btn_save.setDisabled(false);
		grid.setDisabled(true);
		
		// Set form action to add
		rec_id.setValue('');
		action.setValue('__a');
	}
	
	function edit() {
		disable_fields(false);
		btn_add.setDisabled(true);
		btn_edit.setDisabled(true);
		btn_delete.setDisabled(true);
		btn_save.setDisabled(false);
		grid.setDisabled(true);
		action.setValue('__e');
	}

	function del() {
		action.setValue('__d');
		btn_add.setDisabled(true);
		btn_edit.setDisabled(true);
		btn_delete.setDisabled(true);
		
		Ext.MessageBox.confirm("FAMS", "Do you want to delete this record?", 
			function(btn){
				if(btn == "yes") {
					ajaxClass.request({
								url: '/org_setup/division_update',
								params: { 
									id: rec_id.getValue(),
									action: action.getValue()
								},
								callback : function(options, success, response) { 
									obj = Ext.util.JSON.decode(response.responseText);
									grid_data_store.loadData(obj.division_data);
									display_message("Record deleted successfully");
									cancel();
									grid.getSelectionModel().selectFirstRow();
								}
						});
				} else {
					cancel();
					grid.getSelectionModel().selectRow(current_row_index);
				}
				
			});

	}

	function save() {

		// Validate fields before submit
		if(!is_form_valid()) {
			Ext.MessageBox.alert("FAMS", "Please check the values you have entered.");
			return false;
		}

		ajaxClass.request({
				   url: '/org_setup/division_update',
				   params: { 
				   			division_code: division_code.getValue(), 
				   			division_description: division_description.getValue(),
				   			id: rec_id.getValue(),
				   			action: action.getValue()
		   			},
				   callback : function(options, success, response) { 
				   				obj = Ext.util.JSON.decode(response.responseText);
				   				grid_data_store.loadData(obj.division_data);
				   				display_message("Record saved successfully");
				   				
				   				act = action.getValue();
				   														
				   				cancel();
				   				
				   				if(act == '__e') {
									grid.getSelectionModel().selectRow(current_row_index);
								} else if(act == '__a') {
									grid.getSelectionModel().selectLastRow();
									idx = grid.store.indexOf(grid.getSelectionModel().getSelected());
									grid.getView().focusRow(idx);
								}
		   			}
				});
		
	}
	
	function cancel() {
		clear();
		grid.getSelectionModel().deselectRow(current_row_index);
		disable_fields(true);
		grid.setDisabled(false);
	}

	
	// Clear all text fields and error messages
	function clear() {
		division_code.setValue(''); division_code.clearInvalid();
		division_description.setValue(''); division_description.clearInvalid();

		rec_id.setValue('');
		action.setValue('');
	}

	function disable_fields(bool) {
		division_code.setDisabled(bool);
		division_description.setDisabled(bool);
	}
	
	function display_message(text) {
		status_div.highlight("ffffff");		
		status_div.insertHtml("beforeEnd", text);
		setTimeout("status_div.dom.innerHTML=''", 5000);
	}
	
	function is_form_valid() {
		
		return (division_code.validate() &&
					division_description.validate() );

	}
</script>

<div align="right" id="top_links">
	<?php echo $html->link('Branches', '/org_setup/branch_view'); ?> | 
	<?php echo $html->link('Divisions', '/org_setup/division_view'); ?> | 
	<?php echo $html->link('Locations', '/org_setup/location_view'); ?>
</div>
<div id="status_div"></div>
<div id="grid_area" style="width:100%"></div>
<div id="fields_div" style="margin-top:5px">
    <div id="tab1" align="center">
    		<table border="0">
    			<tr>
				<td style="height:30;">&nbsp;</td>
			</tr>
			<tr>
				<td style="background-color:#d3e1f1">
					<table border="0"  >
						
						<tr>
							<td width="100px">Division Code</td>
							<td width="5px">:</td>
							<td colspan="4" id="cnt_division_code"><!-- division code --></td>
						</tr>
						<tr>
							<td valign="top">Description</td>
							<td valign="top" width="5px">:</td>
							<td colspan="4" id="cnt_description"><!-- description --></td>
						</tr>
						<tr>
							<td></td>
							<td width="5px"></td>
							<td id="cnt_hdn_rec_id"><!-- hidden field employee record id (ext gen.) --></td>
							<td></td>
							<td></td>
							<td id="cnt_hdn_action"><!-- hidden field action (ext gen.) --></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
    </div> 

</div>

<?php echo $this->renderElement('command_buttons'); ?>

