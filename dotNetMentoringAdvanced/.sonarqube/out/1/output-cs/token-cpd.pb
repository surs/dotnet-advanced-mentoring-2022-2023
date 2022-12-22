¯
ŸC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\BusinesLayerModule.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
{ 
public 

static 
class 
BusinesLayerModule *
{ 
public 
static 
IServiceCollection (!
RegisterBusinessLayer) >
(> ?
this? C
IServiceCollectionD V
servicesW _
)_ `
{		 	
services

 
. 
AddTransient 
< 
ICartingService -
,- .
Services/ 7
.7 8
CartingService8 F
>F G
(G H
)H I
;I J
return 
services 
; 
} 	
} 
} ‹
£C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\Entities\CartAggregate.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
.& '
Entities' /
{ 
public 

sealed 
record 
CartAggregate &
(& '
Guid' +
CartKey, 3
,3 4
List5 9
<9 :
CartItem: B
>B C
	CartItemsD M
)M N
{ 
public 
CartAggregate 
( 
Guid !
cartKey" )
)) *
:+ ,
this- 1
(1 2
cartKey2 9
,9 :
new; >
List? C
<C D
CartItemD L
>L M
(M N
)N O
)O P
{Q R
}S T
public 
void 
AddItem 
( 
Item  
item! %
,% &
int' *
quantity+ 3
)3 4
{ 	
var		 
cartItem		 
=		 
	CartItems		 $
.		$ %
SingleOrDefault		% 4
(		4 5
ci		5 7
=>		8 :
ci		; =
.		= >
Item		> B
.		B C
Id		C E
==		F H
item		I M
.		M N
Id		N P
)		P Q
;		Q R
if

 
(

 
cartItem

 
!=

 
null

  
)

  !
{ 
	CartItems 
. 
Remove  
(  !
cartItem! )
)) *
;* +
cartItem 
= 
cartItem #
with$ (
{) *
Quantity+ 3
=4 5
cartItem6 >
.> ?
Quantity? G
+H I
quantityJ R
}S T
;T U
} 
else 
{ 
cartItem 
= 
new 
CartItem '
(' (
item( ,
,, -
quantity. 6
)6 7
;7 8
} 
	CartItems 
. 
Add 
( 
cartItem "
)" #
;# $
} 	
public 
void 

RemoveItem 
( 
Item #
item$ (
,( )
int* -
quantity. 6
)6 7
{ 	
var 
cartItem 
= 
	CartItems $
.$ %
SingleOrDefault% 4
(4 5
ci5 7
=>8 :
ci; =
.= >
Item> B
.B C
IdC E
==F H
itemI M
.M N
IdN P
)P Q
;Q R
if 
( 
cartItem 
== 
null  
)  !
{ 
return 
; 
} 
	CartItems 
. 
Remove 
( 
cartItem %
)% &
;& '
if   
(   
cartItem   
.   
Quantity   !
-  " #
quantity  $ ,
<=  - /
$num  0 1
)  1 2
{!! 
return"" 
;"" 
}## 
cartItem%% 
=%% 
cartItem%% 
with%%  $
{%%% &
Quantity%%' /
=%%0 1
cartItem%%2 :
.%%: ;
Quantity%%; C
-%%D E
quantity%%F N
}%%O P
;%%P Q
	CartItems&& 
.&& 
Add&& 
(&& 
cartItem&& "
)&&" #
;&&# $
}'' 	
}(( 
})) £
žC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\Entities\CartItem.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
.& '
Entities' /
{ 
public 

sealed 
record 
CartItem !
(! "
Item" &
Item' +
,+ ,
int- 0
Quantity1 9
)9 :
{ 
} 
} œ
›C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\Entities\Image.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
.& '
Entities' /
{ 
public 

sealed 
record 
Image 
( 
string %
url& )
,) *
string+ 1
alt2 5
)5 6
{ 
} 
} „
šC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\Entities\Item.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
.& '
Entities' /
{ 
public 

sealed 
record 
Item 
( 
int !
Id" $
,$ %
string& ,
Name- 1
,1 2
Image3 8
?8 9
Image: ?
,? @
decimalA H
PriceI N
)N O
{ 
internal 
static 

IValidator "
<" #
Item# '
>' (
	Validator) 2
=>3 5
new6 9
ItemValidator: G
(G H
)H I
;I J
}		 
}

 ¸
¥C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\Exceptions\CartException.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
.& '

Exceptions' 1
{ 
public 

class 
CartException 
:  
	Exception! *
{ 
internal 
static 
CartException %
CartNotFound& 2
=>3 5
new6 9
CartException: G
(G H
$strH X
)X Y
;Y Z
public 
CartException 
( 
string #
?# $
message% ,
,, -
	Exception. 7
?7 8
innerException9 G
)G H
:I J
baseK O
(O P
messageP W
,W X
innerExceptionY g
)g h
{ 	
}

 	
public 
CartException 
( 
string #
?# $
message% ,
), -
:. /
base0 4
(4 5
message5 <
)< =
{ 	
} 	
public 
CartException 
( 
) 
:  
base! %
(% &
)& '
{ 	
} 	
} 
} ¨
§C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\Interfaces\ICartingService.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
.& '

Interfaces' 1
{ 
public 

	interface 
ICartingService $
{ 
void 

CreateCart 
( 
Guid 
cartKey $
)$ %
;% &
List 
< 
CartItem 
> 
GetCartItems #
(# $
Guid$ (
cartKey) 0
)0 1
;1 2
void		 
AddItemToCart		 
(		 
Guid		 
cartKey		  '
,		' (
Item		) -
item		. 2
,		2 3
int		4 7
quantity		8 @
)		@ A
;		A B
void

 
RemoveItemFromCart

 
(

  
Guid

  $
cartKey

% ,
,

, -
Item

. 2
item

3 7
,

7 8
int

9 <
quantity

= E
)

E F
;

F G
void 
RemoveItemFromCart 
(  
Guid  $
cartKey% ,
,, -
int. 1
itemId2 8
,8 9
int: =
quantity> F
)F G
;G H
void  
UpdateItemsInBaskets !
(! "
int" %
id& (
,( )
string* 0
name1 5
,5 6
string7 =
?= >
description? J
,J K
stringL R
?R S
imageUrlT \
,\ ]
decimal^ e
pricef k
)k l
;l m
} 
} À
§C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\Interfaces\ICartRepository.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
.& '

Interfaces' 1
{ 
public 

	interface 
ICartRepository $
{ 
CartAggregate 
GetCart 
( 
Guid "
cartKey# *
)* +
;+ ,
void 

UpdateCart 
( 
CartAggregate %
cart& *
)* +
;+ ,
CartAggregate		 

CreateCart		  
(		  !
Guid		! %
cartKey		& -
)		- .
;		. /
void

 

RemoveCart

 
(

 
CartAggregate

 %
cart

& *
)

* +
;

+ ,
void 

RemoveCart 
( 
Guid 
cartKey $
)$ %
;% &
void 
UpdateBasketsItems 
(  
int  #
itemId$ *
,* +
string, 2
name3 7
,7 8
string9 ?
?? @
descriptionA L
,L M
stringN T
?T U
imageUrlV ^
,^ _
decimal` g
priceh m
)m n
;n o
} 
} ©>
¤C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\Services\CartingService.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
.& '
Services' /
{ 
internal 
sealed 
class 
CartingService (
:) *
ICartingService+ :
{ 
private		 
readonly		 
ICartRepository		 (
_repository		) 4
;		4 5
public 
CartingService 
( 
ICartRepository -

repository. 8
)8 9
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
void 
AddItemToCart !
(! "
Guid" &
cartKey' .
,. /
Item0 4
item5 9
,9 :
int; >
quantity? G
)G H
{ 	
if 
( 
quantity 
<= 
$num 
) 
{ 
throw 
new 
CartException '
(' (
$str( M
)M N
;N O
} 
FluentValidation 
. 
Results $
.$ %
ValidationResult% 5
validationResult6 F
=G H
ItemI M
.M N
	ValidatorN W
.W X
ValidateX `
(` a
itema e
)e f
;f g
if 
( 
! 
validationResult !
.! "
IsValid" )
)) *
{ 
throw 
new 
CartException '
(' (
string( .
.. /
Join/ 3
(3 4
Environment4 ?
.? @
NewLine@ G
,G H
validationResultI Y
.Y Z
ErrorsZ `
.` a
Selecta g
(g h
eh i
=>j l
em n
.n o
ErrorMessageo {
){ |
)| }
)} ~
;~ 
} 
var 
cart 
= 
_repository "
." #
GetCart# *
(* +
cartKey+ 2
)2 3
;3 4
if 
( 
cart 
== 
null 
) 
{ 
cart 
= 
_repository "
." #

CreateCart# -
(- .
cartKey. 5
)5 6
;6 7
}   
cart"" 
."" 
AddItem"" 
("" 
item"" 
,"" 
quantity"" '
)""' (
;""( )
_repository## 
.## 

UpdateCart## "
(##" #
cart### '
)##' (
;##( )
}$$ 	
public&& 
void&& 

CreateCart&& 
(&& 
Guid&& #
cartKey&&$ +
)&&+ ,
{'' 	
_repository(( 
.(( 

CreateCart(( "
(((" #
cartKey((# *
)((* +
;((+ ,
})) 	
public++ 
List++ 
<++ 
CartItem++ 
>++ 
GetCartItems++ *
(++* +
Guid+++ /
cartKey++0 7
)++7 8
{,, 	
var-- 
cart-- 
=-- 
_repository-- "
.--" #
GetCart--# *
(--* +
cartKey--+ 2
)--2 3
;--3 4
if.. 
(.. 
cart.. 
==.. 
null.. 
).. 
{// 
throw00 
CartException00 #
.00# $
CartNotFound00$ 0
;000 1
}11 
return22 
cart22 
.22 
	CartItems22 !
;22! "
}33 	
public55 
void55 
RemoveItemFromCart55 &
(55& '
Guid55' +
cartKey55, 3
,553 4
Item555 9
item55: >
,55> ?
int55@ C
quantity55D L
)55L M
{66 	
var77 
cart77 
=77 
_repository77 "
.77" #
GetCart77# *
(77* +
cartKey77+ 2
)772 3
;773 4
if88 
(88 
cart88 
==88 
null88 
)88 
{99 
throw:: 
CartException:: #
.::# $
CartNotFound::$ 0
;::0 1
};; 

RemoveItem== 
(== 
item== 
,== 
quantity== %
,==% &
cart==' +
)==+ ,
;==, -
}>> 	
public@@ 
void@@ 
RemoveItemFromCart@@ &
(@@& '
Guid@@' +
cartKey@@, 3
,@@3 4
int@@5 8
itemId@@9 ?
,@@? @
int@@A D
quantity@@E M
)@@M N
{AA 	
varBB 
cartBB 
=BB 
_repositoryBB "
.BB" #
GetCartBB# *
(BB* +
cartKeyBB+ 2
)BB2 3
;BB3 4
ifCC 
(CC 
cartCC 
==CC 
nullCC 
)CC 
{DD 
throwEE 
CartExceptionEE #
.EE# $
CartNotFoundEE$ 0
;EE0 1
}FF 
varHH 
itemHH 
=HH 
cartHH 
.HH 
	CartItemsHH %
.HH% &
WhereHH& +
(HH+ ,
iHH, -
=>HH. 0
iHH1 2
.HH2 3
ItemHH3 7
.HH7 8
IdHH8 :
==HH; =
itemIdHH> D
)HHD E
.HHE F
FirstOrDefaultHHF T
(HHT U
)HHU V
;HHV W
ifII 
(II 
itemII 
==II 
nullII 
)II 
{JJ 
returnKK 
;KK 
}LL 

RemoveItemNN 
(NN 
itemNN 
.NN 
ItemNN  
,NN  !
quantityNN" *
,NN* +
cartNN, 0
)NN0 1
;NN1 2
}OO 	
publicQQ 
voidQQ  
UpdateItemsInBasketsQQ (
(QQ( )
intQQ) ,
itemIdQQ- 3
,QQ3 4
stringQQ5 ;
nameQQ< @
,QQ@ A
stringQQB H
?QQH I
descriptionQQJ U
,QQU V
stringQQW ]
?QQ] ^
imageUrlQQ_ g
,QQg h
decimalQQi p
priceQQq v
)QQv w
{RR 	
_repositorySS 
.SS 
UpdateBasketsItemsSS *
(SS* +
itemIdSS+ 1
,SS1 2
nameSS3 7
,SS7 8
descriptionSS9 D
,SSD E
imageUrlSSF N
,SSN O
priceSSP U
)SSU V
;SSV W
}TT 	
privateVV 
voidVV 

RemoveItemVV 
(VV  
ItemVV  $
itemVV% )
,VV) *
intVV+ .
quantityVV/ 7
,VV7 8
CartAggregateVV9 F
cartVVG K
)VVK L
{WW 	
cartXX 
.XX 

RemoveItemXX 
(XX 
itemXX  
,XX  !
quantityXX" *
)XX* +
;XX+ ,
ifYY 
(YY 
cartYY 
.YY 
	CartItemsYY 
.YY 
AnyYY "
(YY" #
)YY# $
)YY$ %
{ZZ 
_repository[[ 
.[[ 

UpdateCart[[ &
([[& '
cart[[' +
)[[+ ,
;[[, -
}\\ 
else]] 
{^^ 
_repository__ 
.__ 

RemoveCart__ &
(__& '
cart__' +
)__+ ,
;__, -
}`` 
}aa 	
}bb 
}cc ê	
¥C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.BusinessLayer\Validators\ItemValidator.cs
	namespace 	
CartingService
 
. 
BusinessLayer &
.& '

Validators' 1
{ 
internal 
class 
ItemValidator  
:! "
AbstractValidator# 4
<4 5
Item5 9
>9 :
{ 
public 
ItemValidator 
( 
) 
{		 	
RuleFor

 
(

 
x

 
=>

 
x

 
.

 
Name

 
)

  
.

  !
NotEmpty

! )
(

) *
)

* +
;

+ ,
RuleFor 
( 
x 
=> 
x 
. 
Id 
) 
. 
NotEmpty '
(' (
)( )
;) *
RuleFor 
( 
x 
=> 
x 
. 
Price  
)  !
.! "
NotEmpty" *
(* +
)+ ,
;, -
} 	
} 
} 