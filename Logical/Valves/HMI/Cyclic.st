
PROGRAM _CYCLIC
    // Map inputs to valve structure
	gValves.HV_1.cmd := ctrl.cmd;
	gValves.HV_1.interlock := ctrl.interlock;
	gValves.HV_1.bg_closed := ctrl.bg_closed;
	gValves.HV_1.bg_open := ctrl.bg_open;
	gValves.HV_1.interlock_safe_state := ctrl.interlock_safe_state;
	gValves.HV_1.bg_wait := ctrl.bg_wait;
	gValves.HV_1.bg_mode := ctrl.bg_mode;
	
	
	ctrl.status.error := gValves.HV_1.status.error;
	ctrl.status.position := gValves.HV_1.status.position;
	ctrl.status.state := gValves.HV_1.status.state;
	ctrl.cmd_out := gValves.HV_1.cmd_out;
	
	END_PROGRAM
