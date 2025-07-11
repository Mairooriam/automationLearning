
(* TODO: Add your comment here *)
FUNCTION_BLOCK Valve_on_off_IMPL
	
	IF interlock = FALSE THEN handle_cmd_act; 
	ELSE cmd_out := cmd_fallback;
	END_IF;
	
END_FUNCTION_BLOCK
