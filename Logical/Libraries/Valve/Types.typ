
TYPE
	valve_typ : 	STRUCT 
		cmd : BOOL;
		cmd_manual : BOOL;
		cmd_out : BOOL;
		cmd_fallback : BOOL;
		mode : BOOL;
		status : INT;
		interlock : BOOL;
	END_STRUCT;
	Valve_mode_enum : 
		(
		E_VALVE_MODE_MANUAL := 0,
		E_VALVE_MODE_AUTO := 1,
		E_VALVE_MODE_REMOTE := 2
		);
END_TYPE
