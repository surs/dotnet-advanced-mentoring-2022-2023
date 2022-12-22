—
ŒC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.API\APIModule.cs
	namespace 	
CartingService
 
. 
API 
{ 
internal		 
static		 
class		 
	APIModule		 #
{

 
public 
static 
IServiceCollection ( 
RegisterDependencies) =
(= >
this> B
IServiceCollectionC U
servicesV ^
)^ _
{ 	
services 
. !
RegisterBusinessLayer &
(& '
)' (
. 
RegisterDataLayer "
(" #
)# $
. 
RegisterApiLayer !
(! "
)" #
. 
RegisterListener !
(! "
)" #
;# $
return 
services 
; 
} 	
public 
static 
IServiceCollection (
RegisterApiLayer) 9
(9 :
this: >
IServiceCollection? Q
servicesR Z
)Z [
{ 	
services 
. 
AddSingleton !
<! "
V1" $
.$ %
CartController% 3
>3 4
(4 5
)5 6
;6 7
services 
. 
AddSingleton !
<! "
V2" $
.$ %
CartController% 3
>3 4
(4 5
)5 6
;6 7
return 
services 
; 
} 	
} 
} Ö
 C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.API\Controllers\V1\CartController.cs
	namespace 	
CartingService
 
. 
API 
. 
Controllers (
.( )
V1) +
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
CartController 
:  !

Controller" ,
{		 
private

 
readonly

 
ICartingService

 (
_cartingService

) 8
;

8 9
public 
CartController 
( 
ICartingService -
cartingService. <
)< =
{ 	
_cartingService 
= 
cartingService ,
;, -
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
GetCart $
($ %
Guid% )
cartKey* 1
)1 2
{ 	
var 
result 
= 
new 
{ 
CartKey 
= 
cartKey !
,! "
Items 
= 
_cartingService '
.' (
GetCartItems( 4
(4 5
cartKey5 <
)< =
} 
; 
return 
Ok 
( 
result 
) 
; 
} 	
[&& 	
HttpPost&&	 
]&& 
public'' 
IActionResult'' 
AddItem'' $
(''$ %
Guid''% )
cartKey''* 1
,''1 2
[''3 4
FromBody''4 <
]''< =
CartItem''> F
item''G K
)''K L
{(( 	
_cartingService)) 
.)) 

CreateCart)) &
())& '
cartKey))' .
))). /
;))/ 0
_cartingService** 
.** 
AddItemToCart** )
(**) *
cartKey*** 1
,**1 2
item**3 7
.**7 8
Item**8 <
,**< =
item**> B
.**B C
Quantity**C K
)**K L
;**L M
return++ 
Ok++ 
(++ 
)++ 
;++ 
},, 	
[66 	

HttpDelete66	 
]66 
[77 	 
ProducesResponseType77	 
(77 
StatusCodes77 )
.77) *
Status200OK77* 5
)775 6
]776 7
[88 	 
ProducesResponseType88	 
(88 
StatusCodes88 )
.88) *
Status404NotFound88* ;
)88; <
]88< =
[99 	 
ProducesResponseType99	 
(99 
StatusCodes99 )
.99) *
Status400BadRequest99* =
)99= >
]99> ?
public:: 
IActionResult:: 

RemoveItem:: '
(::' (
Guid::( ,
cartKey::- 4
,::4 5
int::6 9
itemId::: @
)::@ A
{;; 	
try<< 
{== 
_cartingService>> 
.>>  
RemoveItemFromCart>>  2
(>>2 3
cartKey>>3 :
,>>: ;
itemId>>< B
,>>B C
$num>>D E
)>>E F
;>>F G
return?? 
Ok?? 
(?? 
)?? 
;?? 
}@@ 
catchAA 
(AA 
BusinessLayerAA  
.AA  !

ExceptionsAA! +
.AA+ ,
CartExceptionAA, 9
)AA9 :
{BB 
returnCC 
NotFoundCC 
(CC  
)CC  !
;CC! "
}DD 
catchEE 
(EE 
	ExceptionEE 
exEE 
)EE  
{FF 
returnGG 

BadRequestGG !
(GG! "
exGG" $
.GG$ %
MessageGG% ,
)GG, -
;GG- .
}HH 
}II 	
}JJ 
}KK ô
 C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.API\Controllers\V2\CartController.cs
	namespace 	
CartingService
 
. 
API 
. 
Controllers (
.( )
V2) +
{ 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
CartController 
:  !

Controller" ,
{		 
private

 
readonly

 
ICartingService

 (
_cartingService

) 8
;

8 9
private 
readonly 
V1 
. 
CartController *
_cartControllerV1+ <
;< =
public 
CartController 
( 
ICartingService -
cartingService. <
,< =
V1> @
.@ A
CartControllerA O
cartControllerV1P `
)` a
{ 	
_cartingService 
= 
cartingService ,
;, -
_cartControllerV1 
= 
cartControllerV1  0
;0 1
} 	
[ 	
HttpGet	 
] 
public 
IActionResult 
GetCart $
($ %
Guid% )
cartKey* 1
)1 2
{ 	
var 
result 
= 
_cartingService (
.( )
GetCartItems) 5
(5 6
cartKey6 =
)= >
;> ?
return 
Ok 
( 
result 
) 
; 
} 	
[$$ 	
HttpPost$$	 
]$$ 
public%% 
IActionResult%% 
AddItem%% $
(%%$ %
Guid%%% )
cartKey%%* 1
,%%1 2
[%%3 4
FromBody%%4 <
]%%< =
CartItem%%> F
item%%G K
)%%K L
{&& 	
return'' 
_cartControllerV1'' $
.''$ %
AddItem''% ,
('', -
cartKey''- 4
,''4 5
item''6 :
)'': ;
;''; <
}(( 	
[22 	

HttpDelete22	 
]22 
[33 	 
ProducesResponseType33	 
(33 
StatusCodes33 )
.33) *
Status200OK33* 5
)335 6
]336 7
[44 	 
ProducesResponseType44	 
(44 
StatusCodes44 )
.44) *
Status404NotFound44* ;
)44; <
]44< =
[55 	 
ProducesResponseType55	 
(55 
StatusCodes55 )
.55) *
Status400BadRequest55* =
)55= >
]55> ?
[66 	

HttpDelete66	 
]66 
public77 
IActionResult77 

RemoveItem77 '
(77' (
Guid77( ,
cartKey77- 4
,774 5
int776 9
itemId77: @
)77@ A
{88 	
return99 
_cartControllerV199 $
.99$ %

RemoveItem99% /
(99/ 0
cartKey990 7
,997 8
itemId999 ?
)99? @
;99@ A
}:: 	
};; 
}<< ƒ
ŠC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.API\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder		 
.		 
Services		 
.		 
AddControllers		 
(		  
)		  !
;		! "
builder 
. 
Services 
. #
AddEndpointsApiExplorer (
(( )
)) *
;* +
builder 
. 
Services 
. 
AddSwaggerGen 
( 
o  
=>! #
{ 
var 
xmlFilename 
= 
$" 
{ 
Assembly !
.! " 
GetExecutingAssembly" 6
(6 7
)7 8
.8 9
GetName9 @
(@ A
)A B
.B C
NameC G
}G H
$strH L
"L M
;M N
o 
. 
IncludeXmlComments 
( 
Path 
. 
Combine %
(% &

AppContext& 0
.0 1
BaseDirectory1 >
,> ?
xmlFilename@ K
)K L
)L M
;M N
} 
) 
; 
builder 
. 
Services 
.  
RegisterDependencies %
(% &
)& '
;' (
builder 
. 
Services 
. +
AddApplicationInsightsTelemetry 0
(0 1
builder1 8
.8 9
Configuration9 F
[F G
$strG n
]n o
)o p
;p q
var 
app 
= 	
builder
 
. 
Build 
( 
) 
; 
var 
listener 
= 
app 
. 
Services 
. 

GetService &
<& ' 
IItemChangedListener' ;
>; <
(< =
)= >
;> ?
listener 
. 	
Start	 
( 
) 
; 
if 
( 
app 
. 
Environment 
. 
IsDevelopment !
(! "
)" #
)# $
{ 
app 
. 

UseSwagger 
( 
) 
; 
app 
. 
UseSwaggerUI 
( 
) 
; 
} 
app!! 
.!! 
UseHttpsRedirection!! 
(!! 
)!! 
;!! 
app## 
.## 
UseAuthorization## 
(## 
)## 
;## 
app%% 
.%% 
MapControllers%% 
(%% 
)%% 
;%% 
app'' 
.'' 
Run'' 
('' 
)'' 	
;''	 
