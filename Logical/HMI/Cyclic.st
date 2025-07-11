
PROGRAM _CYCLIC
	(* Insert code here *)
	IF ctrl.cmd THEN gHV_100.cmd := TRUE;
	ELSE gHV_100.cmd := FALSE;
	END_IF;	
	
	IF ctrl.m0 THEN gHV_100.mode := 0;
	ELSIF ctrl.m1 THEN gHV_100.mode := 1;
	END_IF;
	END_PROGRAM
