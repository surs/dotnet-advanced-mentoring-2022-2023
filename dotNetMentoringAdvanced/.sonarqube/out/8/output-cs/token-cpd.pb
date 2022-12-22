Ã
úC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\IItemChangedListener.cs
	namespace 	
CartingService
 
. 
Listener !
{ 
public 

	interface  
IItemChangedListener )
{ 
void 
Start 
( 
) 
; 
} 
} •
üC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\IMessagingConfiguration.cs
	namespace 	
CartingService
 
. 
Listener !
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
string 
Queue 
{ 
get 
; 
init  
;  !
}" #
}		 
}

 ∏9
õC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\ItemChangedListener.cs
	namespace

 	
CartingService


 
.

 
Listener

 !
{ 
internal 
class 
ItemChangedListener &
:' (
IDisposable) 4
,4 5 
IItemChangedListener6 J
{ 
private 
readonly 
ICartingService (
_cartingService) 8
;8 9
private 
readonly #
IMessagingConfiguration 0
_configuration1 ?
;? @
private 
readonly 
TelemetryClient (
?( )

_telemetry* 4
;4 5
private 
IBasicConsumer 
? 
	_consumer  )
;) *
private 
IModel 
? 
_channel  
;  !
private 
IConnection 
? 
_connection (
;( )
private 
bool 
disposedValue "
=# $
false% *
;* +
public 
ItemChangedListener "
(" #
ICartingService# 2
cartingService3 A
,A B#
IMessagingConfigurationC Z
configuration[ h
,h i
TelemetryClientj y
?y z
telemetryClient	{ ä
)
ä ã
{ 	
_cartingService 
= 
cartingService ,
;, -
_configuration 
= 
configuration *
;* +

_telemetry 
= 
telemetryClient (
;( )
} 	
public 
void 
Start 
( 
) 
{ 	
_connection 
= 
_configuration (
.( )
ConnectionFactory) :
.: ;
CreateConnection; K
(K L
)L M
;M N
_channel   
=   
_connection   "
.  " #
CreateModel  # .
(  . /
)  / 0
;  0 1
var!! 
eventingConsumer!!  
=!!! "
new!!# &!
EventingBasicConsumer!!' <
(!!< =
_channel!!= E
)!!E F
;!!F G
eventingConsumer"" 
."" 
Received"" %
+=""& ((
OnItemChangedMessageReceived"") E
;""E F
	_consumer## 
=## 
eventingConsumer## (
;##( )
_channel$$ 
.$$ 
BasicConsume$$ !
($$! "
_configuration$$" 0
.$$0 1
Queue$$1 6
,$$6 7
true$$8 <
,$$< =
	_consumer$$> G
)$$G H
;$$H I
}%% 	
private'' 
void'' (
OnItemChangedMessageReceived'' 1
(''1 2
object''2 8
?''8 9
sender'': @
,''@ A!
BasicDeliverEventArgs''B W
e''X Y
)''Y Z
{(( 	
var)) 
body)) 
=)) 
e)) 
.)) 
Body)) 
.)) 
ToArray)) %
())% &
)))& '
;))' (
var** 
message** 
=** 
Encoding** "
.**" #
UTF8**# '
.**' (
	GetString**( 1
(**1 2
body**2 6
)**6 7
;**7 8
var++ 
itemDto++ 
=++ 
JsonConvert++ %
.++% &
DeserializeObject++& 7
<++7 8
ItemDto++8 ?
>++? @
(++@ A
message++A H
)++H I
;++I J

TrackEvent,, 
(,, 
itemDto,, 
),, 
;,,  
_cartingService-- 
.--  
UpdateItemsInBaskets-- 0
(--0 1
itemDto--1 8
.--8 9
Id--9 ;
,--; <
itemDto--= D
.--D E
Name--E I
,--I J
itemDto--K R
.--R S
Description--S ^
,--^ _
itemDto--` g
.--g h
ImageUrl--h p
,--p q
itemDto--r y
.--y z
Price--z 
)	-- Ä
;
--Ä Å
}// 	
private11 
void11 

TrackEvent11 
(11  
ItemDto11  '
?11' (
data11) -
)11- .
{22 	
if33 
(33 

_telemetry33 
!=33 
null33 "
)33" #
{44 

_telemetry55 
.55 

TrackEvent55 %
(55% &
$str55& ;
,55; <

properties55= G
:55G H
GetEventProperties55I [
(55[ \
data55\ `
)55` a
)55a b
;55b c
}66 
}77 	
private99 
IDictionary99 
<99 
string99 "
,99" #
string99$ *
>99* +
GetEventProperties99, >
(99> ?
ItemDto99? F
?99F G
payload99H O
)99O P
=>99Q S
new:: 

Dictionary:: 
<:: 
string:: !
,::! "
string::# )
>::) *
{;; 
[<< 
$str<< 
]<< 
=<< 
this<< !
.<<! "
ToString<<" *
(<<* +
)<<+ ,
??<<- /
string<<0 6
.<<6 7
Empty<<7 <
,<<< =
[== 
$str== 
]== 
===  !
payload==" )
?==) *
.==* +
Correlation==+ 6
??==7 9
string==: @
.==@ A
Empty==A F
,==F G
[>> 
$str>> 
]>> 
=>> 
JsonConvert>> )
.>>) *
SerializeObject>>* 9
(>>9 :
payload>>: A
)>>A B
}?? 
;?? 
	protectedAA 
virtualAA 
voidAA 
DisposeAA &
(AA& '
boolAA' +
	disposingAA, 5
)AA5 6
{BB 	
ifCC 
(CC 
!CC 
disposedValueCC 
)CC 
{DD 
ifEE 
(EE 
	disposingEE 
)EE 
{FF 
}HH 
_channelJJ 
?JJ 
.JJ 
DisposeJJ !
(JJ! "
)JJ" #
;JJ# $
_connectionKK 
?KK 
.KK 
DisposeKK $
(KK$ %
)KK% &
;KK& '
disposedValueLL 
=LL 
trueLL  $
;LL$ %
}MM 
}NN 	
~PP 	
ItemChangedListenerPP	 
(PP 
)PP 
{QQ 	
DisposeSS 
(SS 
	disposingSS 
:SS 
falseSS $
)SS$ %
;SS% &
}TT 	
publicVV 
voidVV 
DisposeVV 
(VV 
)VV 
{WW 	
DisposeXX 
(XX 
	disposingXX 
:XX 
trueXX #
)XX# $
;XX$ %
GCYY 
.YY 
SuppressFinalizeYY 
(YY  
thisYY  $
)YY$ %
;YY% &
}ZZ 	
}[[ 
}\\ ò
ñC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\ListenerModule.cs
	namespace 	
CartingService
 
. 
Listener !
{ 
public 

static 
class 
ListenerModule &
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
RegisterListener
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
<! " 
IItemChangedListener" 6
,6 7
ItemChangedListener8 K
>K L
(L M
)M N
;N O
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
$str	1 Ÿ
;
Ÿ ⁄
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
} à	
ûC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\MessagingConfiguration.cs
	namespace 	
CartingService
 
. 
Listener !
{ 
internal 
sealed 
class "
MessagingConfiguration 0
:1 2#
IMessagingConfiguration3 J
{ 
public "
MessagingConfiguration %
(% &
)& '
{ 	
ConnectionFactory

 
=

 
new

  #
ConnectionFactory

$ 5
{

6 7
HostName

8 @
=

A B
$str

C N
}

O P
;

P Q
Queue 
= 
$str .
;. /
} 	
public 
ConnectionFactory  
ConnectionFactory! 2
{3 4
get5 8
;8 9
init: >
;> ?
}@ A
public 
string 
Queue 
{ 
get !
;! "
init# '
;' (
}) *
} 
} Æ
ùC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\RabbitMqConfiguration.cs
	namespace 	
CatalogService
 
. 
Exchange !
{ 
internal 
class !
RabbitMqConfiguration (
{ 
public 
string 
Host 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Exchange 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} 