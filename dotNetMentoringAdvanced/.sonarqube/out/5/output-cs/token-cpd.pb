�
�C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.DataLayer\CatalogContext.cs
	namespace 	
CatalogService
 
. 
	DataLayer "
{ 
internal 
sealed
class 
CatalogContext (
:) *
	DbContext+ 4
,4 5
ICatalogContext6 E
{		 
private

 
readonly

 
string

 
_connectionString

  1
;

1 2
public 
DbSet 
< 
Category 
> 

Categories )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public
DbSet
<
Item
>
Items
{
get
;
set
;
}
public 
CatalogContext 
( 
IConfiguration ,

): ;
{ 	
_connectionString 
= 

.- .
GetConnectionString. A
(A B
$strB M
)M N
;N O
} 	
	protected 
override 
void 

(- .#
DbContextOptionsBuilder. E
optionsF M
)M N
{ 	
options 
. 
	UseSqlite 
( 
_connectionString /
)/ 0
;0 1
} 	
void 
ICatalogContext
. 
SaveChanges (
(( )
)) *
{ 	
SaveChanges 
( 
) 
; 
} 	
} 
} �

�C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.DataLayer\DataLayerModule.cs
	namespace 	
CatalogService
 
. 
	DataLayer "
{ 
public		 

static		 
class		 
DataLayerModule		 '
{

 
public 
static 
IServiceCollection (
RegisterDataLayer) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
)[ \
{ 	
services
.
AddDbContext
<
ICatalogContext
,
CatalogContext
>
(
ServiceLifetime
.
	Singleton
)
;
services 
. 
AddSingleton !
<! "
ICategoryRepository" 5
,5 6
CategoryRepository7 I
>I J
(J K
)K L
;L M
services 
. 
AddSingleton !
<! "
IItemRepository" 1
,1 2
ItemRepository3 A
>A B
(B C
)C D
;D E
return 
services 
; 
} 	
} 
} �A
�C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.DataLayer\EntitiesMapping.cs
	namespace 	
CatalogService
 
. 
	DataLayer "
{ 
internal 
static
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
{ 
cfg
.
ShouldUseConstructor
=
ctor
=>
ctor
.

;
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
.& '
Category' /
,/ 0
Data1 5
.5 6
Category6 >
>> ?
(? @
)@ A
;A B
cfg 
. 
	CreateMap 
< 
Data "
." #
Category# +
,+ ,
Business- 5
.5 6
Category6 >
>> ?
(? @
)@ A
. 
ForCtorParam !
(! "
nameof" (
(( )
Business) 1
.1 2
Category2 :
.: ;
Id; =
)= >
,> ?
o@ A
=>B D
oE F
.F G
MapFromG N
(N O
sO P
=>Q S
sT U
.U V
IdV X
)X Y
)Y Z
. 
ForCtorParam !
(! "
nameof" (
(( )
Business) 1
.1 2
Category2 :
.: ;
Name; ?
)? @
,@ A
oB C
=>D F
oG H
.H I
MapFromI P
(P Q
sQ R
=>S U
sV W
.W X
NameX \
)\ ]
)] ^
. 
ForCtorParam !
(! "
nameof" (
(( )
Business) 1
.1 2
Category2 :
.: ;
Image; @
)@ A
,A B
oC D
=>E G
oH I
.I J
MapFromJ Q
(Q R
sR S
=>T V
sW X
.X Y
ImageUrlY a
)a b
)b c
. 
ForCtorParam !
(! "
nameof" (
(( )
Business) 1
.1 2
Category2 :
.: ;
ParentCategory; I
)I J
,J K
oL M
=>N P
oQ R
.R S
MapFromS Z
(Z [
s[ \
=>] _
s` a
.a b
ParentCategoryb p
)p q
)q r
;r s
cfg 
. 
	CreateMap 
< 
Business &
.& '
Item' +
,+ ,
Data- 1
.1 2
Item2 6
>6 7
(7 8
)8 9
. 
	ForMember 
( 
i  
=>! #
i$ %
.% &

CategoryId& 0
,0 1
o2 3
=>4 6
o7 8
.8 9
MapFrom9 @
(@ A
sA B
=>C E
sF G
.G H
CategoryH P
.P Q
IdQ S
)S T
)T U
. 
	ForMember 
( 
i  
=>! #
i$ %
.% &
Category& .
,. /
o0 1
=>2 4
o5 6
.6 7
Ignore7 =
(= >
)> ?
)? @
;@ A
cfg!! 
.!! 
	CreateMap!! 
<!! 
Data!! "
.!!" #
Item!!# '
,!!' (
Business!!) 1
.!!1 2
Item!!2 6
>!!6 7
(!!7 8
)!!8 9
."" 
ForCtorParam"" %
(""% &
nameof""& ,
("", -
Business""- 5
.""5 6
Item""6 :
."": ;
Id""; =
)""= >
,""> ?
o""@ A
=>""B D
o""E F
.""F G
MapFrom""G N
(""N O
s""O P
=>""Q S
s""T U
.""U V
Id""V X
)""X Y
)""Y Z
.## 
ForCtorParam## %
(##% &
nameof##& ,
(##, -
Business##- 5
.##5 6
Item##6 :
.##: ;
Name##; ?
)##? @
,##@ A
o##B C
=>##D F
o##G H
.##H I
MapFrom##I P
(##P Q
s##Q R
=>##S U
s##V W
.##W X
Name##X \
)##\ ]
)##] ^
.$$ 
ForCtorParam$$ %
($$% &
nameof$$& ,
($$, -
Business$$- 5
.$$5 6
Item$$6 :
.$$: ;
Description$$; F
)$$F G
,$$G H
o$$I J
=>$$K M
o$$N O
.$$O P
MapFrom$$P W
($$W X
s$$X Y
=>$$Z \
s$$] ^
.$$^ _
Description$$_ j
)$$j k
)$$k l
.%% 
ForCtorParam%% %
(%%% &
nameof%%& ,
(%%, -
Business%%- 5
.%%5 6
Item%%6 :
.%%: ;
Image%%; @
)%%@ A
,%%A B
o%%C D
=>%%E G
o%%H I
.%%I J
MapFrom%%J Q
(%%Q R
s%%R S
=>%%T V
s%%W X
.%%X Y
ImageUrl%%Y a
)%%a b
)%%b c
.&& 
ForCtorParam&& %
(&&% &
nameof&&& ,
(&&, -
Business&&- 5
.&&5 6
Item&&6 :
.&&: ;
Category&&; C
)&&C D
,&&D E
o&&F G
=>&&H J
o&&K L
.&&L M
MapFrom&&M T
(&&T U
s&&U V
=>&&W Y
s&&Z [
.&&[ \
Category&&\ d
)&&d e
)&&e f
.'' 
ForCtorParam'' %
(''% &
nameof''& ,
('', -
Business''- 5
.''5 6
Item''6 :
.'': ;
Price''; @
)''@ A
,''A B
o''C D
=>''E G
o''H I
.''I J
MapFrom''J Q
(''Q R
s''R S
=>''T V
s''W X
.''X Y
Price''Y ^
)''^ _
)''_ `
.(( 
ForCtorParam(( %
(((% &
nameof((& ,
(((, -
Business((- 5
.((5 6
Item((6 :
.((: ;
Amount((; A
)((A B
,((B C
o((D E
=>((F H
o((I J
.((J K
MapFrom((K R
(((R S
s((S T
=>((U W
s((X Y
.((Y Z
Amount((Z `
)((` a
)((a b
;((b c
})) 
)))
;)) 
return** 
config** 
.** 
CreateMapper** &
(**& '
)**' (
;**( )
}++ 	
},, 
}-- �
�C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.DataLayer\Interfaces\ICatalogContext.cs
	namespace 	
CatalogService
 
. 
	DataLayer "
." #

Interfaces# -
{ 
internal 
	interface
ICatalogContext &
{ 
public 
DbSet 
< 
Category 
> 

Categories )
{* +
get, /
;/ 0
}1 2
public		 
DbSet		 
<		 
Item		 
>		 
Items		  
{		! "
get		# &
;		& '
}		( )
void

 
SaveChanges


(

 
)

 
;

 
} 
} �;
�C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.DataLayer\Migrations\20221015203128_Initial.cs
	namespace 	
CatalogService
 
. 
	DataLayer "
." #

Migrations# -
{ 
public 

partial 
class 
Initial  
:! "
	Migration# ,
{ 
	protected		 
override		 
void		 
Up		  "
(		" #
MigrationBuilder		# 3
migrationBuilder		4 D
)		D E
{

 	
migrationBuilder 
. 
CreateTable (
(( )
name 
: 
$str "
," #
columns
:
table
=>
new
{ 
Id 
= 
table 
. 
Column %
<% &
int& )
>) *
(* +
type+ /
:/ 0
$str1 :
,: ;
nullable< D
:D E
falseF K
)K L
. 

Annotation #
(# $
$str$ :
,: ;
true< @
)@ A
,A B
Name 
= 
table  
.  !
Column! '
<' (
string( .
>. /
(/ 0
type0 4
:4 5
$str6 <
,< =
nullable> F
:F G
falseH M
)M N
,N O
ImageUrl 
= 
table $
.$ %
Column% +
<+ ,
string, 2
>2 3
(3 4
type4 8
:8 9
$str: @
,@ A
nullableB J
:J K
trueL P
)P Q
,Q R
ParentCategoryId $
=% &
table' ,
., -
Column- 3
<3 4
int4 7
>7 8
(8 9
type9 =
:= >
$str? H
,H I
nullableJ R
:R S
trueT X
)X Y
} 
, 
constraints 
: 
table "
=># %
{ 
table 
. 

PrimaryKey $
($ %
$str% 4
,4 5
x6 7
=>8 :
x; <
.< =
Id= ?
)? @
;@ A
table 
. 

ForeignKey $
($ %
name 
: 
$str I
,I J
column 
: 
x  !
=>" $
x% &
.& '
ParentCategoryId' 7
,7 8
principalTable &
:& '
$str( 4
,4 5
principalColumn '
:' (
$str) -
)- .
;. /
} 
) 
; 
migrationBuilder 
. 
CreateTable (
(( )
name   
:   
$str   
,   
columns!! 
:!! 
table!! 
=>!! !
new!!" %
{"" 
Id## 
=## 
table## 
.## 
Column## %
<##% &
int##& )
>##) *
(##* +
type##+ /
:##/ 0
$str##1 :
,##: ;
nullable##< D
:##D E
false##F K
)##K L
.$$ 

Annotation$$ #
($$# $
$str$$$ :
,$$: ;
true$$< @
)$$@ A
,$$A B
Name%% 
=%% 
table%%  
.%%  !
Column%%! '
<%%' (
string%%( .
>%%. /
(%%/ 0
type%%0 4
:%%4 5
$str%%6 <
,%%< =
nullable%%> F
:%%F G
false%%H M
)%%M N
,%%N O
Description&& 
=&&  !
table&&" '
.&&' (
Column&&( .
<&&. /
string&&/ 5
>&&5 6
(&&6 7
type&&7 ;
:&&; <
$str&&= C
,&&C D
nullable&&E M
:&&M N
true&&O S
)&&S T
,&&T U
ImageUrl'' 
='' 
table'' $
.''$ %
Column''% +
<''+ ,
string'', 2
>''2 3
(''3 4
type''4 8
:''8 9
$str'': @
,''@ A
nullable''B J
:''J K
true''L P
)''P Q
,''Q R

CategoryId(( 
=((  
table((! &
.((& '
Column((' -
<((- .
int((. 1
>((1 2
(((2 3
type((3 7
:((7 8
$str((9 B
,((B C
nullable((D L
:((L M
false((N S
)((S T
,((T U
Price)) 
=)) 
table)) !
.))! "
Column))" (
<))( )
decimal))) 0
>))0 1
())1 2
type))2 6
:))6 7
$str))8 >
,))> ?
nullable))@ H
:))H I
false))J O
)))O P
,))P Q
Amount** 
=** 
table** "
.**" #
Column**# )
<**) *
int*** -
>**- .
(**. /
type**/ 3
:**3 4
$str**5 >
,**> ?
nullable**@ H
:**H I
false**J O
)**O P
}++ 
,++ 
constraints,, 
:,, 
table,, "
=>,,# %
{-- 
table.. 
... 

PrimaryKey.. $
(..$ %
$str..% /
,../ 0
x..1 2
=>..3 5
x..6 7
...7 8
Id..8 :
)..: ;
;..; <
table// 
.// 

ForeignKey// $
(//$ %
name00 
:00 
$str00 >
,00> ?
column11 
:11 
x11  !
=>11" $
x11% &
.11& '

CategoryId11' 1
,111 2
principalTable22 &
:22& '
$str22( 4
,224 5
principalColumn33 '
:33' (
$str33) -
,33- .
onDelete44  
:44  !
ReferentialAction44" 3
.443 4
Cascade444 ;
)44; <
;44< =
}55 
)55 
;55 
migrationBuilder77 
.77 
CreateIndex77 (
(77( )
name88 
:88 
$str88 6
,886 7
table99 
:99 
$str99 #
,99# $
column:: 
::: 
$str:: *
)::* +
;::+ ,
migrationBuilder<< 
.<< 
CreateIndex<< (
(<<( )
name== 
:== 
$str== +
,==+ ,
table>> 
:>> 
$str>> 
,>> 
column?? 
:?? 
$str?? $
)??$ %
;??% &
}@@ 	
	protectedBB 
overrideBB 
voidBB 
DownBB  $
(BB$ %
MigrationBuilderBB% 5
migrationBuilderBB6 F
)BBF G
{CC 	
migrationBuilderDD 
.DD 
	DropTableDD &
(DD& '
nameEE 
:EE 
$strEE 
)EE 
;EE 
migrationBuilderGG 
.GG 
	DropTableGG &
(GG& '
nameHH 
:HH 
$strHH "
)HH" #
;HH# $
}II 	
}JJ 
}KK �

�C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.DataLayer\Model\Category.cs
	namespace 	
CatalogService
 
. 
	DataLayer "
." #
Model# (
{ 
public 

class 
Category 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
=) *
string+ 1
.1 2
Empty2 7
;7 8
public		 
string		 
?		 
ImageUrl		 
{		  !
get		" %
;		% &
set		' *
;		* +
}		, -
public

 
int

 
?

 
ParentCategoryId

 $
{

% &
get

' *
;

* +
set

, /
;

/ 0
}

1 2
public 
Category 
? 
ParentCategory '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
}
} �
�C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.DataLayer\Model\Item.cs
	namespace 	
CatalogService
 
. 
	DataLayer "
." #
Model# (
{ 
public 

class 
Item 
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
 
Category

 
?

 
Category

 !
{

" #
get

$ '
;

' (
set

) ,
;

, -
}

. /
=

0 1
null

2 6
;

6 7
public 
decimal 
Price 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
Amount 
{ 
get 
;  
set! $
;$ %
}& '
}
} �4
�C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.DataLayer\Repositories\CategoryRepository.cs
	namespace 	
CatalogService
 
. 
	DataLayer "
." #
Repositories# /
{		 
internal

 
sealed


class

 
CategoryRepository

 ,
:

- .
ICategoryRepository

/ B
{ 
private 
readonly 
ICatalogContext (
_context) 1
;1 2
private
readonly
IMapper
_mapper
;
public 
CategoryRepository !
(! "
ICatalogContext" 1
context2 9
)9 :
{ 	
_context 
= 
context 
; 
_mapper 
= 
EntitiesMapping %
.% &$
ConfigureAndCreateMapper& >
(> ?
)? @
;@ A
} 	
public 
Business 
. 
Category  
AddCategory! ,
(, -
Business- 5
.5 6
Category6 >
category? G
)G H
{ 	
var 
categoryDto 
= 
_mapper &
.& '
Map' *
<* +
Data+ /
./ 0
Category0 8
>8 9
(9 :
category: B
)B C
;C D
var 
newCategory 
= 
_context &
.& '

Categories' 1
.1 2
Add2 5
(5 6
categoryDto6 A
)A B
;B C
_context 
. 
SaveChanges  
(  !
)! "
;" #
return 
_mapper 
. 
Map 
< 
Business '
.' (
Category( 0
>0 1
(1 2
newCategory2 =
.= >
Entity> D
)D E
;E F
} 	
public 
bool 
DeleteCategory "
(" #
int# &
id' )
)) *
{ 	
var 
category 
= 
_context #
.# $

Categories$ .
.. /
FirstOrDefault/ =
(= >
c> ?
=>@ B
cC D
.D E
IdE G
==H J
idK M
)M N
;N O
if   
(   
category   
==   
null    
)    !
{!! 
return"" 
false"" 
;"" 
}## 
var%% 
childCategories%% 
=%%  !
_context%%" *
.%%* +

Categories%%+ 5
.%%5 6
Where%%6 ;
(%%; <
c%%< =
=>%%> @
c%%A B
.%%B C
ParentCategoryId%%C S
==%%T V
id%%W Y
)%%Y Z
;%%Z [
var&& 
items&& 
=&& 
_context&&  
.&&  !
Items&&! &
.&&& '
Where&&' ,
(&&, -
i&&- .
=>&&/ 1
i&&2 3
.&&3 4

CategoryId&&4 >
==&&? A
id&&B D
||&&E G
childCategories&&H W
.&&W X
Any&&X [
(&&[ \
c&&\ ]
=>&&^ `
c&&a b
.&&b c
Id&&c e
==&&f h
i&&i j
.&&j k

CategoryId&&k u
)&&u v
)&&v w
;&&w x
_context'' 
.'' 
Items'' 
.'' 
RemoveRange'' &
(''& '
items''' ,
)'', -
;''- .
_context(( 
.(( 

Categories(( 
.((  
RemoveRange((  +
(((+ ,
childCategories((, ;
)((; <
;((< =
_context** 
.** 

Categories** 
.**  
Remove**  &
(**& '
category**' /
)**/ 0
;**0 1
_context++ 
.++ 
SaveChanges++  
(++  !
)++! "
;++" #
return,, 
true,, 
;,, 
}-- 	
public// 
List// 
<// 
Business// 
.// 
Category// %
>//% &
GetAllCategories//' 7
(//7 8
)//8 9
{00 	
var11 

categories11 
=11 
_context11 %
.11% &

Categories11& 0
.110 1
Include111 8
(118 9
c119 :
=>11; =
c11> ?
.11? @
ParentCategory11@ N
)11N O
.11O P
ToList11P V
(11V W
)11W X
;11X Y
return22 
_mapper22 
.22 
Map22 
<22 
List22 #
<22# $
Business22$ ,
.22, -
Category22- 5
>225 6
>226 7
(227 8

categories228 B
)22B C
;22C D
}33 	
public55 
Business55 
.55 
Category55  
?55  !
GetCategory55" -
(55- .
int55. 1
id552 4
)554 5
{66 	
return77 
_mapper77 
.77 
Map77 
<77 
Business77 '
.77' (
Category77( 0
>770 1
(771 2
_context772 :
.77: ;

Categories77; E
.77E F
FirstOrDefault77F T
(77T U
c77U V
=>77W Y
c77Z [
.77[ \
Id77\ ^
==77_ a
id77b d
)77d e
)77e f
;77f g
}88 	
public:: 
bool:: 
UpdateCategory:: "
(::" #
Business::# +
.::+ ,
Category::, 4
category::5 =
)::= >
{;; 	
var<< 
entity<< 
=<< 
_context<< !
.<<! "

Categories<<" ,
.<<, -
Update<<- 3
(<<3 4
_mapper<<4 ;
.<<; <
Map<<< ?
<<<? @
Data<<@ D
.<<D E
Category<<E M
><<M N
(<<N O
category<<O W
)<<W X
)<<X Y
;<<Y Z
_context== 
.== 
SaveChanges==  
(==  !
)==! "
;==" #
return>> 
entity>> 
!=>> 
null>> !
;>>! "
}?? 	
}BB 
}CC �5
�C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.DataLayer\Repositories\ItemRepository.cs
	namespace

 	
CatalogService
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
sealed
class 
ItemRepository (
:) *
IItemRepository+ :
{
private 
readonly 
ICatalogContext (
_context) 1
;1 2
private 
readonly 
IMapper  
_mapper! (
;( )
public 
ItemRepository 
( 
ICatalogContext -
context. 5
)5 6
{ 	
_context 
= 
context 
; 
_mapper 
= 
EntitiesMapping %
.% &$
ConfigureAndCreateMapper& >
(> ?
)? @
;@ A
} 	
public 
Business 
. 
Item 
AddItem $
($ %
Business% -
.- .
Item. 2
item3 7
)7 8
{ 	
var 
itemDto 
= 
_mapper !
.! "
Map" %
<% &
Data& *
.* +
Item+ /
>/ 0
(0 1
item1 5
)5 6
;6 7
var 
category 
= 
_context #
.# $

Categories$ .
.. /
FirstOrDefault/ =
(= >
c> ?
=>@ B
cC D
.D E
IdE G
==H J
itemDtoK R
.R S

CategoryIdS ]
)] ^
;^ _
if 
( 
category 
== 
null  
)  !
{ 
throw 
new 
CatalogException *
(* +
$str+ ?
)? @
;@ A
} 
itemDto   
.   
Category   
=   
category   '
;  ' (
var!! 
newItem!! 
=!! 
_context!! "
.!!" #
Items!!# (
.!!( )
Add!!) ,
(!!, -
itemDto!!- 4
)!!4 5
;!!5 6
_context"" 
."" 
SaveChanges""  
(""  !
)""! "
;""" #
return## 
_mapper## 
.## 
Map## 
<## 
Business## '
.##' (
Item##( ,
>##, -
(##- .
newItem##. 5
.##5 6
Entity##6 <
)##< =
;##= >
}$$ 	
public&& 
bool&& 

DeleteItem&& 
(&& 
int&& "
id&&# %
)&&% &
{'' 	
var(( 
item(( 
=(( 
_context(( 
.((  
Items((  %
.((% &
FirstOrDefault((& 4
(((4 5
c((5 6
=>((7 9
c((: ;
.((; <
Id((< >
==((? A
id((B D
)((D E
;((E F
if)) 
()) 
item)) 
==)) 
null)) 
))) 
{** 
return++ 
false++ 
;++ 
},, 
_context.. 
... 
Items.. 
... 
Remove.. !
(..! "
item.." &
)..& '
;..' (
_context// 
.// 
SaveChanges//  
(//  !
)//! "
;//" #
return00 
true00 
;00 
}11 	
public33 
List33 
<33 
Item33 
>33 
GetAllItems33 %
(33% &
)33& '
{44 	
var55 
items55 
=55 
_context55  
.55  !
Items55! &
.55& '
Include55' .
(55. /
i55/ 0
=>551 3
i554 5
.555 6
Category556 >
)55> ?
.55? @
ToList55@ F
(55F G
)55G H
;55H I
return66 
_mapper66 
.66 
Map66 
<66 
List66 #
<66# $
Business66$ ,
.66, -
Item66- 1
>661 2
>662 3
(663 4
items664 9
)669 :
;66: ;
}77 	
public99 
Business99 
.99 
Item99 
GetItem99 $
(99$ %
int99% (
id99) +
)99+ ,
{:: 	
return;; 
_mapper;; 
.;; 
Map;; 
<;; 
Business;; '
.;;' (
Item;;( ,
>;;, -
(;;- .
_context;;. 6
.;;6 7
Items;;7 <
.;;< =
FirstOrDefault;;= K
(;;K L
c;;L M
=>;;N P
c;;Q R
.;;R S
Id;;S U
==;;V X
id;;Y [
);;[ \
);;\ ]
;;;] ^
}<< 	
public>> 
bool>> 

UpdateItem>> 
(>> 
Item>> #
item>>$ (
)>>( )
{?? 	
var@@ 
entity@@ 
=@@ 
_context@@ !
.@@! "
Items@@" '
.@@' (
SingleOrDefault@@( 7
(@@7 8
i@@8 9
=>@@: <
i@@= >
.@@> ?
Id@@? A
==@@B D
item@@E I
.@@I J
Id@@J L
)@@L M
;@@M N
ifAA 
(AA 
entityAA 
==AA 
nullAA 
)AA 
{BB 
returnCC 
falseCC 
;CC 
}DD 
entityFF 
.FF 
NameFF 
=FF 
itemFF 
.FF 
NameFF #
;FF# $
entityGG 
.GG 
DescriptionGG 
=GG  
itemGG! %
.GG% &
DescriptionGG& 1
;GG1 2
entityHH 
.HH 

CategoryIdHH 
=HH 
itemHH  $
.HH$ %
CategoryHH% -
.HH- .
IdHH. 0
;HH0 1
entityII 
.II 
PriceII 
=II 
itemII 
.II  
PriceII  %
;II% &
entityJJ 
.JJ 
AmountJJ 
=JJ 
itemJJ  
.JJ  !
AmountJJ! '
;JJ' (
_contextKK 
.KK 
SaveChangesKK  
(KK  !
)KK! "
;KK" #
returnLL 
trueLL 
;LL 
}MM 	
}NN 
}OO 