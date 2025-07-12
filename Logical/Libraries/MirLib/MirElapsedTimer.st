
(* TODO: Add your comment here *)
FUNCTION_BLOCK MirElapsedTimer
	IF Enable THEN
		IF NOT timer_initialized THEN
			last_cycle_time := clock_ms();
			Elapsed := T#0ms;
			timer_initialized := TRUE;
		ELSE
			cur_time := clock_ms();
			delta_time := cur_time - last_cycle_time;
			last_cycle_time := cur_time;
			Elapsed := Elapsed + delta_time;
		END_IF;
		IF Elapsed >= Delay THEN
			Out := TRUE;
		END_IF;
	ELSE
		Out := FALSE;
		Elapsed := T#0ms;
		timer_initialized := FALSE;
	END_IF;
END_FUNCTION_BLOCK
