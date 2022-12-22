´
—C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.ConsoleInterface\Program.cs
using 
IHost 
host 
= 
Host 
.  
CreateDefaultBuilder ,
(, -
args- 1
)1 2
. 
ConfigureServices 
( 
( 
context 
,  
services! )
)) *
=>+ -
{ 
services		 
.

 	!
RegisterBusinessLayer

	 
(

 
)

  
. 	
RegisterDataLayer	 
( 
) 
; 
} 
) 
. 
Build 

(
 
) 
; 