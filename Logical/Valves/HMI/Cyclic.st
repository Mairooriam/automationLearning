
PROGRAM _CYCLIC
	(* Insert code here *)
	IF ctrl.cmd THEN gValves.HV_1.cmd := TRUE;
	ELSE gValves.HV_1.cmd := FALSE;
	END_IF;	
	
	IF ctrl.m0 THEN gValves.HV_1.mode := 0;
	ELSIF ctrl.m1 THEN gValves.HV_1.mode := 1;
	END_IF;
	END_PROGRAM
