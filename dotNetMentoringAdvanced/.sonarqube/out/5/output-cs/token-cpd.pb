Ô
”C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.Exchange\Dtos\ItemDto.cs
	namespace 	
CatalogService
 
. 
Exchange !
.! "
Dtos" &
{ 
public 

class 
ItemDto 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public 
string 
? 
Description "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
string 
? 
ImageUrl 
{  !
get" %
;% &
set' *
;* +
}, -
public		 
int		 

CategoryId		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
public

 
decimal

 
Price

 
{

 
get

 "
;

" #
set

$ '
;

' (
}

) *
public 
int 
Amount 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
? 
Correlation "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} Ž
—C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.Exchange\EntitiesMapping.cs
	namespace 	
CatalogService
 
. 
Exchange !
{ 
internal 
static 
class 
EntitiesMapping )
{ 
internal		 
static		 
IMapper		 $
ConfigureAndCreateMapper		  8
(		8 9
)		9 :
{

 	
var 
config 
= 
new 
MapperConfiguration 0
(0 1
cfg1 4
=>5 7
{ 
cfg 
.  
ShouldUseConstructor (
=) *
ctor+ /
=>0 2
ctor3 7
.7 8
IsConstructor8 E
;E F
cfg 
. 
	CreateMap 
< 
string $
?$ %
,% &
Uri' *
?* +
>+ ,
(, -
)- .
. 
ConvertUsing !
(! "
s" #
=>$ &
s' (
!=) +
null, 0
?1 2
new3 6
Uri7 :
(: ;
s; <
)< =
:> ?
null@ D
)D E
;E F
cfg 
. 
	CreateMap 
< 
Uri !
?! "
," #
string$ *
?* +
>+ ,
(, -
)- .
. 
ConvertUsing !
(! "
u" #
=>$ &
u' (
!=) +
null, 0
?1 2
u3 4
.4 5
AbsolutePath5 A
:B C
nullD H
)H I
;I J
cfg 
. 
	CreateMap 
< 
Business &
.& '
Item' +
,+ ,
Data- 1
.1 2
ItemDto2 9
>9 :
(: ;
); <
. 
	ForMember 
( 
i  
=>! #
i$ %
.% &

CategoryId& 0
,0 1
o2 3
=>4 6
o7 8
.8 9
MapFrom9 @
(@ A
sA B
=>C E
sF G
.G H
CategoryH P
.P Q
IdQ S
)S T
)T U
. 
	ForMember 
( 
i  
=>! #
i$ %
.% &
Correlation& 1
,1 2
o3 4
=>5 7
o8 9
.9 :
Ignore: @
(@ A
)A B
)B C
;C D
} 
) 
; 
return 
config 
. 
CreateMapper &
(& '
)' (
;( )
} 	
} 
} š
–C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.Exchange\ExchangeModule.cs
	namespace 	
CatalogService
 
. 
Exchange !
{ 
public 

static 
class 
ExchangeModule &
{		 
public

 
static

 
IServiceCollection

 (
RegisterExchange

) 9
(

9 :
this

: >
IServiceCollection

? Q
services

R Z
)

Z [
{ 	
services 
. 
AddSingleton !
<! "#
IMessagingConfiguration" 9
,9 :"
MessagingConfiguration; Q
>Q R
(R S
)S T
;T U
services 
. 
AddSingleton !
<! "!
IItemMessagingService" 7
,7 8 
ItemMessagingService9 M
>M N
(N O
)O P
;P Q
services 
. 
AddSingleton !
<! "
TelemetryClient" 1
>1 2
(2 3
provider3 ;
=>< >
{ "
TelemetryConfiguration &
configuration' 4
=5 6"
TelemetryConfiguration7 M
.M N
CreateDefaultN [
([ \
)\ ]
;] ^
configuration 
. 
ConnectionString .
=/ 0
$str	1 Ø
;
Ø Ù
return 
new 
TelemetryClient *
(* +
configuration+ 8
)8 9
;9 :
} 
) 
; 
return 
services 
; 
} 	
} 
} ±
¨C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.Exchange\Interfaces\IItemMessagingService.cs
	namespace 	
CatalogService
 
. 
Exchange !
.! "

Interfaces" ,
{ 
public 

	interface !
IItemMessagingService *
{ 
void  
SendItemChangeUpdate !
(! "
object" (
?( )
sender* 0
,0 1 
ItemChangedEventArgs2 F
	eventArgsG P
)P Q
;Q R
void 
Start 
( 
) 
; 
void		 
Stop		 
(		 
)		 
;		 
}

 
} Ú
ªC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.Exchange\Interfaces\IMessagingConfiguration.cs
	namespace 	
CatalogService
 
. 
Exchange !
.! "

Interfaces" ,
{ 
internal 
	interface #
IMessagingConfiguration .
{ 
ConnectionFactory 
ConnectionFactory +
{, -
get. 1
;1 2
init3 7
;7 8
}9 :
string 
Exchange 
{ 
get 
; 
init #
;# $
}% &
}		 
}

 ×0
œC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.Exchange\ItemMessagingService.cs
	namespace 	
CatalogService
 
. 
Exchange !
{ 
internal 
sealed 
class  
ItemMessagingService .
:/ 0!
IItemMessagingService1 F
{ 
private 
readonly 
IItemService %
_itemService& 2
;2 3
private 
readonly #
IMessagingConfiguration 0#
_messagingConfiguration1 H
;H I
private 
readonly 
TelemetryClient (
?( )

_telemetry* 4
;4 5
private 
readonly 
IMapper  
_mapper! (
;( )
public  
ItemMessagingService #
(# $
IItemService$ 0
itemService1 <
,< =#
IMessagingConfiguration> U"
messagingConfigurationV l
,l m
TelemetryClientn }
?} ~
	telemetry	 ˆ
)
ˆ ‰
{ 	
_itemService 
= 
itemService &
;& '#
_messagingConfiguration #
=$ %"
messagingConfiguration& <
;< =

_telemetry 
= 
	telemetry "
;" #
_mapper 
= 
EntitiesMapping %
.% &$
ConfigureAndCreateMapper& >
(> ?
)? @
;@ A
} 	
public 
void 
Start 
( 
) 
{ 	
_itemService 
. 
OnItemChanged &
+=' ) 
SendItemChangeUpdate* >
;> ?
}   	
public"" 
void"" 
Stop"" 
("" 
)"" 
{## 	
_itemService$$ 
.$$ 
OnItemChanged$$ &
-=$$' ) 
SendItemChangeUpdate$$* >
;$$> ?
}%% 	
public'' 
void''  
SendItemChangeUpdate'' (
(''( )
object'') /
?''/ 0
sender''1 7
,''7 8 
ItemChangedEventArgs''9 M
	eventArgs''N W
)''W X
{(( 	
using)) 
var)) 

connection))  
=))! "#
_messagingConfiguration))# :
.)): ;
ConnectionFactory)); L
.))L M
CreateConnection))M ]
())] ^
)))^ _
;))_ `
using** 
var** 
channel** 
=** 

connection**  *
.*** +
CreateModel**+ 6
(**6 7
)**7 8
;**8 9
var++ 
message++ 
=++ 

GetMessage++ $
(++$ %
	eventArgs++% .
)++. /
;++/ 0

TrackEvent,, 
(,, 
	eventArgs,,  
),,  !
;,,! "
channel-- 
.-- 
BasicPublish--  
(--  !
exchange--! )
:--) *#
_messagingConfiguration--+ B
.--B C
Exchange--C K
,--K L

routingKey.. 
:.. 
string.. "
..." #
Empty..# (
,..( )
basicProperties// 
://  
null//! %
,//% &
body00 
:00 
message00 
)00 
;00 
}11 	
private33 
IDictionary33 
<33 
string33 "
,33" #
string33$ *
>33* +
GetEventProperties33, >
(33> ? 
ItemChangedEventArgs33? S
	eventArgs33T ]
)33] ^
=>33_ a
new44 

Dictionary44 
<44 
string44 !
,44! "
string44# )
>44) *
{55 
[66 
$str66 
]66 
=66 
this66 !
.66! "
ToString66" *
(66* +
)66+ ,
??66- /
string660 6
.666 7
Empty667 <
,66< =
[77 
$str77 
]77 
=77  !
	eventArgs77" +
.77+ ,
Correlation77, 7
??778 :
string77; A
.77A B
Empty77B G
,77G H
[88 
$str88 
]88 
=88 
JsonConvert88 )
.88) *
SerializeObject88* 9
(889 :
	eventArgs88: C
.88C D
ChangedItem88D O
)88O P
}99 
;99 
private;; 
void;; 

TrackEvent;; 
(;;   
ItemChangedEventArgs;;  4
	eventArgs;;5 >
);;> ?
{<< 	
if== 
(== 

_telemetry== 
!=== 
null== "
)==" #
{>> 

_telemetry?? 
.?? 

TrackEvent?? %
(??% &
$str??& 7
,??7 8

properties??9 C
:??C D
GetEventProperties??E W
(??W X
	eventArgs??X a
)??a b
)??b c
;??c d
}@@ 
}AA 	
privateCC 
byteCC 
[CC 
]CC 

GetMessageCC !
(CC! " 
ItemChangedEventArgsCC" 6
dataCC7 ;
)CC; <
{DD 	
varEE 
dtoEE 
=EE 
_mapperEE 
.EE 
MapEE !
<EE! "
ItemDtoEE" )
>EE) *
(EE* +
dataEE+ /
.EE/ 0
ChangedItemEE0 ;
)EE; <
;EE< =
dtoFF 
.FF 
CorrelationFF 
=FF 
dataFF "
.FF" #
CorrelationFF# .
;FF. /
varGG 

serializedGG 
=GG 
JsonConvertGG (
.GG( )
SerializeObjectGG) 8
(GG8 9
dtoGG9 <
)GG< =
;GG= >
returnHH 
EncodingHH 
.HH 
UTF8HH  
.HH  !
GetBytesHH! )
(HH) *

serializedHH* 4
)HH4 5
;HH5 6
}II 	
}JJ 
}KK Å	
žC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.Exchange\MessagingConfiguration.cs
	namespace 	
CatalogService
 
. 
Exchange !
{ 
internal 
sealed 
class "
MessagingConfiguration 0
:1 2#
IMessagingConfiguration3 J
{ 
public		 "
MessagingConfiguration		 %
(		% &
IConfiguration		& 4
configuration		5 B
)		B C
{

 	
ConnectionFactory 
= 
new  #
ConnectionFactory$ 5
{6 7
HostName8 @
=A B
$strC N
}O P
;P Q
Exchange 
= 
$str -
;- .
} 	
public 
ConnectionFactory  
ConnectionFactory! 2
{3 4
get5 8
;8 9
init: >
;> ?
}@ A
public 
string 
Exchange 
{  
get! $
;$ %
init& *
;* +
}, -
} 
} 