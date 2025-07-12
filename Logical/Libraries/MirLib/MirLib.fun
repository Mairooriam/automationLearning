
{REDUND_ERROR} FUNCTION_BLOCK Valve_on_off_IMPL (*TODO: Add your comment here*) (*$GROUP=Miro,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		cmd : {REDUND_UNREPLICABLE} BOOL;
	END_VAR
	VAR_OUTPUT
		cmd_out : BOOL;
	END_VAR
	VAR
		cmd_rising_edge : BOOL;
		cmd_falling_edge : BOOL;
		cmd_changed : BOOL;
		cmd_previous : BOOL;
	END_VAR
	VAR_INPUT
		interlock : BOOL;
		interlock_safe_state : BOOL;
	END_VAR
	VAR
		supervision_active : BOOL;
	END_VAR
	VAR_OUTPUT
		status : valve_status_typ;
	END_VAR
	VAR_INPUT
		bg_open : BOOL; (*Limnit switch for open position*)
		bg_closed : BOOL; (*Limit switch for closed position*)
		bg_wait : TIME;
		bg_mode : limit_switch_mode_enum; (*Limit switch mode*)
	END_VAR
	VAR
		bg_expected_state : bg_expected_enum;
		bg_error : BOOL;
		ElapsedTimer : MirElapsedTimer;
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

{REDUND_ERROR} FUNCTION_BLOCK MirElapsedTimer (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		Enable : {REDUND_UNREPLICABLE} BOOL;
		Delay : TIME;
	END_VAR
	VAR_OUTPUT
		Elapsed : TIME;
		Out : BOOL;
	END_VAR
	VAR
		last_cycle_time : TIME;
		delta_time : TIME;
		cur_time : TIME;
		timer_initialized : BOOL;
	END_VAR
END_FUNCTION_BLOCK
