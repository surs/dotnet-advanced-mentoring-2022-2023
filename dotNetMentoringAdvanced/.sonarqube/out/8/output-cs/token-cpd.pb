Ì
œC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\IItemChangedListener.cs
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
} ¥
ŸC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\IMessagingConfiguration.cs
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
 û9
›C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\ItemChangedListener.cs
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
telemetryClient	{ Š
)
Š ‹
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
;++I J
if,, 
(,, 
itemDto,, 
==,, 
null,, 
),,  
{-- 
return.. 
;.. 
}// 

TrackEvent00 
(00 
itemDto00 
)00 
;00  
_cartingService11 
.11  
UpdateItemsInBaskets11 0
(110 1
itemDto111 8
.118 9
Id119 ;
,11; <
itemDto11= D
.11D E
Name11E I
,11I J
itemDto11K R
.11R S
Description11S ^
,11^ _
itemDto11` g
.11g h
ImageUrl11h p
,11p q
itemDto11r y
.11y z
Price11z 
)	11 €
;
11€ 
}33 	
private55 
void55 

TrackEvent55 
(55  
ItemDto55  '
?55' (
data55) -
)55- .
{66 	
if77 
(77 

_telemetry77 
!=77 
null77 "
)77" #
{88 

_telemetry99 
.99 

TrackEvent99 %
(99% &
$str99& ;
,99; <

properties99= G
:99G H
GetEventProperties99I [
(99[ \
data99\ `
)99` a
)99a b
;99b c
}:: 
};; 	
private== 
IDictionary== 
<== 
string== "
,==" #
string==$ *
>==* +
GetEventProperties==, >
(==> ?
ItemDto==? F
?==F G
payload==H O
)==O P
=>==Q S
new>> 

Dictionary>> 
<>> 
string>> !
,>>! "
string>># )
>>>) *
{?? 
[@@ 
$str@@ 
]@@ 
=@@ 
this@@ !
.@@! "
ToString@@" *
(@@* +
)@@+ ,
??@@- /
string@@0 6
.@@6 7
Empty@@7 <
,@@< =
[AA 
$strAA 
]AA 
=AA  !
payloadAA" )
?AA) *
.AA* +
CorrelationAA+ 6
??AA7 9
stringAA: @
.AA@ A
EmptyAAA F
,AAF G
[BB 
$strBB 
]BB 
=BB 
JsonConvertBB )
.BB) *
SerializeObjectBB* 9
(BB9 :
payloadBB: A
)BBA B
}CC 
;CC 
	protectedEE 
virtualEE 
voidEE 
DisposeEE &
(EE& '
boolEE' +
	disposingEE, 5
)EE5 6
{FF 	
ifGG 
(GG 
!GG 
disposedValueGG 
)GG 
{HH 
_channelII 
?II 
.II 
DisposeII !
(II! "
)II" #
;II# $
_connectionJJ 
?JJ 
.JJ 
DisposeJJ $
(JJ$ %
)JJ% &
;JJ& '
disposedValueKK 
=KK 
trueKK  $
;KK$ %
}LL 
}MM 	
~OO 	
ItemChangedListenerOO	 
(OO 
)OO 
{PP 	
DisposeRR 
(RR 
	disposingRR 
:RR 
falseRR $
)RR$ %
;RR% &
}SS 	
publicUU 
voidUU 
DisposeUU 
(UU 
)UU 
{VV 	
DisposeWW 
(WW 
	disposingWW 
:WW 
trueWW #
)WW# $
;WW$ %
GCXX 
.XX 
SuppressFinalizeXX 
(XX  
thisXX  $
)XX$ %
;XX% &
}YY 	
}ZZ 
}[[ ˜
–C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\ListenerModule.cs
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
$str	1 Ù
;
Ù Ú
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
} ˆ	
žC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.Listener\MessagingConfiguration.cs
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
ConnectionFactory		 
=		 
new		  #
ConnectionFactory		$ 5
{		6 7
HostName		8 @
=		A B
$str		C N
}		O P
;		P Q
Queue

 
=

 
$str

 .
;

. /
} 	
public 
ConnectionFactory  
ConnectionFactory! 2
{3 4
get5 8
;8 9
init: >
;> ?
}@ A
public 
string 
Queue 
{ 
get !
;! "
init# '
;' (
}) *
} 
} 