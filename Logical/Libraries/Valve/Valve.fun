
{REDUND_ERROR} FUNCTION_BLOCK Valve_on_off_IMPL (*TODO: Add your comment here*) (*$GROUP=Miro,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		cmd : {REDUND_UNREPLICABLE} BOOL;
		cmd_manual : {REDUND_UNREPLICABLE} BOOL;
		mode : INT;
		cmd_fallback : BOOL;
		interlock : BOOL;
	END_VAR
	VAR_OUTPUT
		cmd_out : BOOL;
		status : {REDUND_UNREPLICABLE} INT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK Valve_on_off (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_IN_OUT
		Valve : valve_typ;
	END_VAR
	VAR
		Valve_on_off_IMPL_Instance : Valve_on_off_IMPL;
	END_VAR
END_FUNCTION_BLOCK
