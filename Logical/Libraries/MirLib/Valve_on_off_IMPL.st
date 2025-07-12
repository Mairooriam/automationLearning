FUNCTION_BLOCK Valve_on_off_IMPL
	ElapsedTimer();
	// RISIGN EDGE OR FALLINH CHECK
	IF cmd = TRUE AND cmd_previous = FALSE THEN
		cmd_rising_edge := TRUE;
		ElapsedTimer.Enable := FALSE;
		bg_error := FALSE;
	ELSE
		cmd_rising_edge := FALSE;
	END_IF;
    
	IF cmd = FALSE AND cmd_previous = TRUE THEN
		cmd_falling_edge := TRUE;
		ElapsedTimer.Enable := FALSE;
		bg_error := FALSE;
	ELSE
		cmd_falling_edge := FALSE;
	END_IF;
	
	IF interlock = FALSE THEN ACT_UpdateCmdOut;
	ELSE 
		cmd_out := interlock_safe_state;
	END_IF;
	
	// Handle rising edge
	IF cmd_rising_edge THEN
		CASE bg_mode OF
			BG_NONE:
				// No supervision needed
                
			BG_BOTH, BG_OPEN: 
				ElapsedTimer.Delay := bg_wait;
				ElapsedTimer.Enable := TRUE;
				supervision_active := TRUE;
				bg_expected_state := BG_EXPECTED_OPEN; // Expecting valve to open
                
			BG_CLOSED:
			// No supervision needed
		END_CASE;
	END_IF;

	// Handle falling edge
	IF cmd_falling_edge THEN
		CASE bg_mode OF
			BG_NONE:
				// No supervision needed
			BG_BOTH, BG_CLOSED: 
				ElapsedTimer.Delay := bg_wait;
				ElapsedTimer.Enable := TRUE;
				supervision_active := TRUE;
				bg_expected_state := BG_EXPECTED_CLOSED; 
                
			BG_OPEN:
			// No supervision needed
		END_CASE;
	END_IF;
    
	// Supervision logic
	IF supervision_active THEN
		CASE bg_mode OF
			BG_BOTH:
				IF (bg_expected_state = BG_EXPECTED_OPEN AND bg_open AND NOT bg_closed) OR 
					(bg_expected_state = BG_EXPECTED_CLOSED AND bg_closed AND NOT bg_open) THEN
					supervision_active := FALSE;
					ElapsedTimer.Enable := FALSE;
					bg_error := FALSE;
				END_IF;
                
			BG_OPEN:
				IF bg_expected_state = BG_EXPECTED_OPEN AND bg_open THEN
					supervision_active := FALSE;
					ElapsedTimer.Enable := FALSE;
					bg_error := FALSE;
				END_IF;
                
			BG_CLOSED:
				IF bg_expected_state = BG_EXPECTED_CLOSED AND bg_closed THEN
					supervision_active := FALSE;
					ElapsedTimer.Enable := FALSE;
					bg_error := FALSE;
				END_IF;
		END_CASE;
        
		IF ElapsedTimer.Out THEN
			bg_error := TRUE;
			supervision_active := FALSE;
			ElapsedTimer.Enable := FALSE;
		END_IF;
	END_IF;
	
	// Continuous monitoring after successful supervision
	IF NOT supervision_active AND NOT bg_error THEN
		CASE bg_mode OF
			BG_BOTH:
				IF cmd_out AND (NOT bg_open OR bg_closed) THEN 
					bg_error := TRUE; 
				ELSIF NOT cmd_out AND (bg_open OR NOT bg_closed) THEN 
					bg_error := TRUE; 
				END_IF;
			BG_OPEN:
				IF cmd_out AND NOT bg_open THEN 
					bg_error := TRUE; 
				END_IF;
			BG_CLOSED:
				IF NOT cmd_out AND NOT bg_closed THEN 
					bg_error := TRUE; 
				END_IF;
		END_CASE;
	END_IF;
	ACT_UpdateValveStatus;
	cmd_previous := cmd;
END_FUNCTION_BLOCK
