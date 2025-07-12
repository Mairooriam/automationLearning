ACTION ACT_UpdateValveStatus:

	CASE bg_mode OF
		BG_BOTH:
			IF bg_open AND NOT bg_closed THEN
				status.position := OPEN;
			ELSIF NOT bg_open AND bg_closed THEN
				status.position := CLOSED;
			ELSIF bg_open AND bg_closed THEN
				status.position := INTERMEDIATE;
			ELSE
				status.position := UNKNOWN;
			END_IF;
            
		BG_OPEN:
			IF bg_open THEN 
				status.position := OPEN;
			ELSE 
				status.position := UNKNOWN;
			END_IF;
            
		BG_CLOSED:
			IF bg_closed THEN 
				status.position := CLOSED;
			ELSE 
				status.position := UNKNOWN;
			END_IF;
            
		BG_NONE:
			status.position := UNKNOWN;
	END_CASE;
    
	// Update main status and error
	IF interlock THEN
		status.state := INTERLOCKED;
		status.error := NONE;
        
	ELSIF supervision_active THEN
		status.state := SUPERVISING;
		status.error := NONE;
        
	ELSIF bg_error THEN
		status.state := ERROR;
        
		IF ElapsedTimer.Out THEN
			IF bg_expected_state = BG_EXPECTED_OPEN THEN
				status.error := TIMEOUT_OPENING;
			ELSE
				status.error := TIMEOUT_CLOSING;
			END_IF;
            
		ELSIF status.position = INTERMEDIATE THEN
			status.error := BOTH_FEEDBACK;
            
		ELSIF cmd_out AND status.position = CLOSED THEN
			status.error := UNEXPECTED_CLOSED;
            
		ELSIF NOT cmd_out AND status.position = OPEN THEN
			status.error := UNEXPECTED_OPEN;
            
		ELSIF status.position = UNKNOWN AND bg_mode <> BG_NONE THEN
			status.error := NO_FEEDBACK;
            
		ELSE
			status.error := NONE;
		END_IF;
        
	ELSE
		status.state := OK;
		status.error := NONE;
	END_IF;
END_ACTION