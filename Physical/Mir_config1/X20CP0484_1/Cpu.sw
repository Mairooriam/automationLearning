﻿<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="4.9"?>
<SwConfiguration CpuAddress="" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#4">
    <Task Name="MirValveEx" Source="Valves.MirValveExample.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="HMI" Source="Valves.HMI.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="MirValveE1" Source="Valves.MirValveExampleST.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Timer" Source="Timer.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <Libraries>
    <LibraryObject Name="MirLib" Source="Libraries.MirLib.lby" Memory="UserROM" Language="IEC" Debugging="true" />
  </Libraries>
</SwConfiguration>