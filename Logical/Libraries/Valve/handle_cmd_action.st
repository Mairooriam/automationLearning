
ACTION handle_cmd_act: 
	CASE mode OF
		E_VALVE_MODE_MANUAL:
			IF cmd_manual = TRUE THEN
				cmd_out := TRUE;
			ELSE
				cmd_out := FALSE;
			END_IF;	
		E_VALVE_MODE_AUTO:
			IF cmd = TRUE THEN
				cmd_out := TRUE;
			ELSE
				cmd_out := FALSE;
			END_IF;	
	END_CASE;
END_ACTION
