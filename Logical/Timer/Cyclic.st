
PROGRAM _CYCLIC
	(* Insert code here *)
	MirTimer_0(Delay := T#5s, Enable := TRUE);
	
	IF MirTimer_0.Elapsed >= T#5s THEN
		 MirTimer_0.Enable := FALSE;	
	END_IF;
	test_time := clock_ms();
END_PROGRAM
