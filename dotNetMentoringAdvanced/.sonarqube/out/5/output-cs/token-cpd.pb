ó
˜C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.DataLayer\DataLayerModule.cs
	namespace 	
CartingService
 
. 
	DataLayer "
{ 
public 

static 
class 
DataLayerModule '
{ 
public		 
static		 
IServiceCollection		 (
RegisterDataLayer		) :
(		: ;
this		; ?
IServiceCollection		@ R
services		S [
)		[ \
{

 	
services 
. 
AddTransient !
<! "
ICartRepository" 1
,1 2
CartRepository3 A
>A B
(B C
)C D
;D E
services 
. 
AddSingleton !
(! "
_" #
=>$ &
EntitiesMapping' 6
.6 7$
ConfigureAndCreateMapper7 O
(O P
)P Q
)Q R
;R S
return 
services 
; 
} 	
} 
} ª	
•C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.DataLayer\Dtos\CartDto.cs
	namespace 	
CartingService
 
. 
	DataLayer "
." #
Dtos# '
{ 
internal 
sealed 
class 
CartDto !
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public

 
Guid

 
CartKey

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
List 
< 
CartItemDto 
>  
	CartItems! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public 
CartDto 
( 
) 
{ 	
	CartItems 
= 
new 
List  
<  !
CartItemDto! ,
>, -
(- .
). /
;/ 0
} 	
} 
} Ô
™C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.DataLayer\Dtos\CartItemDto.cs
	namespace 	
CartingService
 
. 
	DataLayer "
." #
Dtos# '
{ 
internal 
sealed 
class 
CartItemDto %
{ 
public 
ItemDto 
Item 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Quantity 
{ 
get !
;! "
set# &
;& '
}( )
} 
} Ê
–C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.DataLayer\Dtos\ImageDto.cs
	namespace 	
CartingService
 
. 
	DataLayer "
." #
Dtos# '
{ 
internal 
sealed 
class 
ImageDto "
{ 
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Alt 
{ 
get 
;  
set! $
;$ %
}& '
} 
}		 ú
•C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.DataLayer\Dtos\ItemDto.cs
	namespace 	
CartingService
 
. 
	DataLayer "
." #
Dtos# '
{ 
internal 
sealed 
class 
ItemDto !
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
}' (
public 
ImageDto 
Image 
{ 
get  #
;# $
set% (
;( )
}* +
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
}		 
}

 
˜C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.DataLayer\EntitiesMapping.cs
	namespace 	
CartingService
 
. 
	DataLayer "
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
. 
	CreateMap 
< 
CartAggregate +
,+ ,
CartDto- 4
>4 5
(5 6
)6 7
. 
	ForMember 
( 
x  
=>! #
x$ %
.% &
Id& (
,( )
o* +
=>, .
o/ 0
.0 1
Ignore1 7
(7 8
)8 9
)9 :
. 

ReverseMap 
(  
)  !
. 
ForCtorParam %
(% &
nameof& ,
(, -
CartAggregate- :
.: ;
CartKey; B
)B C
,C D
oE F
=>G I
oJ K
.K L
MapFromL S
(S T
srcT W
=>X Z
src[ ^
.^ _
CartKey_ f
)f g
)g h
. 
ForCtorParam %
(% &
nameof& ,
(, -
CartAggregate- :
.: ;
	CartItems; D
)D E
,E F
oG H
=>I K
oL M
.M N
MapFromN U
(U V
srcV Y
=>Z \
src] `
.` a
	CartItemsa j
)j k
)k l
;l m
cfg 
. 
	CreateMap 
< 
CartItem &
,& '
CartItemDto( 3
>3 4
(4 5
)5 6
.6 7

ReverseMap7 A
(A B
)B C
;C D
cfg 
. 
	CreateMap 
< 
Item "
," #
ItemDto$ +
>+ ,
(, -
)- .
. 

ReverseMap 
(  
)  !
;! "
cfg 
. 
	CreateMap 
< 
Image #
,# $
ImageDto% -
>- .
(. /
)/ 0
.0 1

ReverseMap1 ;
(; <
)< =
;= >
} 
) 
; 
config 
. &
AssertConfigurationIsValid -
(- .
). /
;/ 0
return 
new 
Mapper 
( 
config $
)$ %
;% &
} 	
} 
} ¨J
¤C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CartingService.DataLayer\Repositories\CartRepository.cs
	namespace

 	
CartingService


 
.

 
	DataLayer

 "
.

" #
Repositories

# /
{ 
internal 
sealed 
class 
CartRepository (
:) *
ICartRepository+ :
{ 
private 
readonly 
string 
_connectionString  1
;1 2
private 
readonly 
IMapper  
_mapper! (
;( )
public 
CartRepository 
( 
IConfiguration ,
config- 3
)3 4
{ 	
_connectionString 
= 
config  &
.& '
GetConnectionString' :
(: ;
$str; F
)F G
;G H
_mapper 
= 
EntitiesMapping %
.% &$
ConfigureAndCreateMapper& >
(> ?
)? @
;@ A
} 	
public 
CartAggregate 

CreateCart '
(' (
Guid( ,
cartKey- 4
)4 5
{ 	
var 
cartDto 
= 
new 
CartDto %
{& '
CartKey( /
=0 1
cartKey2 9
}: ;
;; <
using 
var 
db 
= 
new 
LiteDatabase +
(+ ,
_connectionString, =
)= >
;> ?
var 
cartCollection 
=  
db! #
.# $
GetCollection$ 1
<1 2
CartDto2 9
>9 :
(: ;
$str; B
)B C
;C D
if 
( 
cartCollection 
. 
Exists %
(% &
dto& )
=>* ,
dto- 0
.0 1
CartKey1 8
==9 ;
cartKey< C
)C D
)D E
{ 
cartDto 
= 
GetFromCollection +
(+ ,
cartKey, 3
,3 4
cartCollection5 C
)C D
;D E
} 
else   
{!! 
cartCollection"" 
."" 
Insert"" %
(""% &
cartDto""& -
)""- .
;"". /
}## 
return%% 
_mapper%% 
.%% 
Map%% 
<%% 
CartAggregate%% ,
>%%, -
(%%- .
cartDto%%. 5
)%%5 6
;%%6 7
}&& 	
public(( 
CartAggregate(( 
GetCart(( $
((($ %
Guid((% )
cartKey((* 1
)((1 2
{)) 	
using** 
var** 
db** 
=** 
new** 
LiteDatabase** +
(**+ ,
_connectionString**, =
)**= >
;**> ?
var++ 
cartCollection++ 
=++  
db++! #
.++# $
GetCollection++$ 1
<++1 2
CartDto++2 9
>++9 :
(++: ;
$str++; B
)++B C
;++C D
CartDto,, 
cart,, 
=,, 
GetFromCollection,, ,
(,,, -
cartKey,,- 4
,,,4 5
cartCollection,,6 D
),,D E
;,,E F
return-- 
_mapper-- 
.-- 
Map-- 
<-- 
CartAggregate-- ,
>--, -
(--- .
cart--. 2
)--2 3
;--3 4
}.. 	
public00 
void00 

RemoveCart00 
(00 
CartAggregate00 ,
cart00- 1
)001 2
{11 	

RemoveCart22 
(22 
cart22 
.22 
CartKey22 #
)22# $
;22$ %
}33 	
public55 
void55 

RemoveCart55 
(55 
Guid55 #
cartKey55$ +
)55+ ,
{66 	
using77 
var77 
db77 
=77 
new77 
LiteDatabase77 +
(77+ ,
_connectionString77, =
)77= >
;77> ?
var88 
cartCollection88 
=88  
db88! #
.88# $
GetCollection88$ 1
<881 2
CartDto882 9
>889 :
(88: ;
$str88; B
)88B C
;88C D
cartCollection99 
.99 

DeleteMany99 %
(99% &
x99& '
=>99( *
x99+ ,
.99, -
CartKey99- 4
==995 7
cartKey998 ?
)99? @
;99@ A
}:: 	
public<< 
void<< 

UpdateCart<< 
(<< 
CartAggregate<< ,
cart<<- 1
)<<1 2
{== 	
var>> 
cartDto>> 
=>> 
_mapper>> !
.>>! "
Map>>" %
<>>% &
CartDto>>& -
>>>- .
(>>. /
cart>>/ 3
)>>3 4
;>>4 5
using?? 
var?? 
db?? 
=?? 
new?? 
LiteDatabase?? +
(??+ ,
_connectionString??, =
)??= >
;??> ?
var@@ 
cartCollection@@ 
=@@  
db@@! #
.@@# $
GetCollection@@$ 1
<@@1 2
CartDto@@2 9
>@@9 :
(@@: ;
$str@@; B
)@@B C
;@@C D
varAA 
cartInDbAA 
=AA 
GetFromCollectionAA ,
(AA, -
cartAA- 1
.AA1 2
CartKeyAA2 9
,AA9 :
cartCollectionAA; I
)AAI J
;AAJ K
cartDtoBB 
.BB 
IdBB 
=BB 
cartInDbBB !
.BB! "
IdBB" $
;BB$ %
cartCollectionCC 
.CC 
UpdateCC !
(CC! "
cartDtoCC" )
)CC) *
;CC* +
}DD 	
privateFF 
staticFF 
CartDtoFF 
GetFromCollectionFF 0
(FF0 1
GuidFF1 5
cartKeyFF6 =
,FF= >
ILiteCollectionFF? N
<FFN O
CartDtoFFO V
>FFV W
cartCollectionFFX f
)FFf g
{GG 	
returnHH 
cartCollectionHH !
.HH! "
QueryHH" '
(HH' (
)HH( )
.II 
WhereII "
(II" #
cartII# '
=>II( *
cartII+ /
.II/ 0
CartKeyII0 7
==II8 :
cartKeyII; B
)IIB C
.JJ 
SingleOrDefaultJJ ,
(JJ, -
)JJ- .
;JJ. /
}KK 	
publicMM 
voidMM 
UpdateBasketsItemsMM &
(MM& '
intMM' *
itemIdMM+ 1
,MM1 2
stringMM3 9
nameMM: >
,MM> ?
stringMM@ F
descriptionMMG R
,MMR S
stringMMT Z
imageUrlMM[ c
,MMc d
decimalMMe l
priceMMm r
)MMr s
{NN 	
usingOO 
varOO 
dbOO 
=OO 
newOO 
LiteDatabaseOO +
(OO+ ,
_connectionStringOO, =
)OO= >
;OO> ?
varPP 
cartCollectionPP 
=PP  
dbPP! #
.PP# $
GetCollectionPP$ 1
<PP1 2
CartDtoPP2 9
>PP9 :
(PP: ;
$strPP; B
)PPB C
;PPC D
varQQ 
cartsToUpdateQQ 
=QQ 
cartCollectionQQ  .
.QQ. /
QueryQQ/ 4
(QQ4 5
)QQ5 6
.QQ6 7
WhereQQ7 <
(QQ< =
cQQ= >
=>QQ? A
cQQB C
.QQC D
	CartItemsQQD M
.QQM N
SelectQQN T
(QQT U
iQQU V
=>QQW Y
iQQZ [
.QQ[ \
ItemQQ\ `
.QQ` a
IdQQa c
)QQc d
.QQd e
AnyQQe h
(QQh i
idQQi k
=>QQl n
idQQo q
==QQr t
itemIdQQu {
)QQ{ |
)QQ| }
.QQ} ~
ToList	QQ~ „
(
QQ„ …
)
QQ… †
;
QQ† ‡
foreachRR 
(RR 
varRR 
cartRR 
inRR  
cartsToUpdateRR! .
)RR. /
{SS 
foreachTT 
(TT 
varTT 
itemTT  
inTT! #
cartTT$ (
.TT( )
	CartItemsTT) 2
)TT2 3
{UU 
ifVV 
(VV 
itemVV 
.VV 
ItemVV  
.VV  !
IdVV! #
==VV$ &
itemIdVV' -
)VV- .
{WW 
itemXX 
.XX 
ItemXX !
.XX! "
NameXX" &
=XX' (
nameXX) -
;XX- .
itemYY 
.YY 
ItemYY !
.YY! "
PriceYY" '
=YY( )
priceYY* /
;YY/ 0
itemZZ 
.ZZ 
ItemZZ !
.ZZ! "
ImageZZ" '
.ZZ' (
UrlZZ( +
=ZZ, -
imageUrlZZ. 6
;ZZ6 7
}[[ 
}\\ 
}]] 
cartCollection__ 
.__ 
Update__ !
(__! "
cartsToUpdate__" /
)__/ 0
;__0 1
}`` 	
}aa 
}bb 