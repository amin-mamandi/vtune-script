# Intel Vtune Profiler

These are simple scripts which automate profiling a large numbe rof python programs.

## Here is some useful commands:

 - This example runs the Hotspots analysis for the sample target located at the /home/test/ directory on a Linux* system, saves the analysis result in the r001hs subdirectory of the current directory, and displays the default summary report.
```
vtune -collect hotspots -result-dir r001hs -quiet /home/test/sample
```

  - Run Analysis:
   ```
   -collect performance-snapshot 
   -collect hostspots
   -collect uarch-exploration
   -collect memory-access
   ```
   
   - Action Options:
   ```
   -r, -result-dir=<str> #specify result directory path
   
   ```
   
   - Control Running Analysis:
   ```
   -command status #print current status
   
   ```
   
   - Get Report:
   ```
   -R, -report summary #oevrall performance data
   -R, -report top-down #call tree, CPU/wait time func
   -R, -report hw-events #hardware events
   ```
