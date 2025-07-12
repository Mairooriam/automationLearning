
ACTION ACT_UpdateCmdOut: 
	IF cmd = TRUE THEN
		cmd_out := TRUE;
	ELSE
		cmd_out := FALSE;
	END_IF;	

END_ACTION
