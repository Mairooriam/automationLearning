
TYPE
	HMI_Valve_on_off : 	STRUCT 
		cmd : BOOL;
		cmd_manual : BOOL;
		mode : INT;
		status : INT;
	END_STRUCT;
	test_ctrl : 	STRUCT 
		cmd : BOOL;
		m1 : BOOL;
		m0 : BOOL;
	END_STRUCT;
END_TYPE
