<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="4.9"?>
<SwConfiguration CpuAddress="" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#4">
    <Task Name="MirValveEx" Source="MirValveExample.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="HMI" Source="HMI.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="MirValveE1" Source="MirValveExampleST.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <Libraries>
    <LibraryObject Name="Valve" Source="Libraries.Valve.lby" Memory="UserROM" Language="IEC" Debugging="true" />
  </Libraries>
</SwConfiguration>