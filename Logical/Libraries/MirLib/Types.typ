
TYPE
	bg_expected_enum : 
		(
		BG_EXPECTED_OPEN := 0,
		BG_EXPECTED_CLOSED := 1
		);
	limit_switch_mode_enum : 
		(
		BG_NONE := 0,
		BG_BOTH := 1,
		BG_OPEN := 2,
		BG_CLOSED := 3
		);
	valve_error_enum : 
		(
		NONE := 0,
		TIMEOUT_OPENING := 1,
		TIMEOUT_CLOSING := 2,
		UNEXPECTED_CLOSED := 3,
		UNEXPECTED_OPEN := 4,
		BOTH_FEEDBACK := 5,
		NO_FEEDBACK := 6
		);
	valve_position_enum : 
		(
		UNKNOWN := 0,
		CLOSED := 1,
		OPEN := 2,
		INTERMEDIATE := 3
		);
	valve_state_enum : 
		(
		OK := 0,
		INTERLOCKED := 1,
		SUPERVISING := 2,
		ERROR := 3
		);
	valve_status_typ : 	STRUCT 
		position : valve_position_enum;
		error : valve_error_enum;
		state : valve_state_enum;
	END_STRUCT;
	valve_typ : 	STRUCT 
		cmd : BOOL;
		cmd_out : BOOL;
		interlock_safe_state : BOOL;
		status : valve_status_typ;
		interlock : BOOL;
		bg_closed : BOOL;
		bg_open : BOOL;
		bg_wait : TIME;
		bg_mode : limit_switch_mode_enum;
	END_STRUCT;
END_TYPE
