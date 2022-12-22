⁄
†C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\BusinessLayerModule.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
{ 
public 

static 
class 
BusinessLayerModule +
{ 
public		 
static		 
IServiceCollection		 (!
RegisterBusinessLayer		) >
(		> ?
this		? C
IServiceCollection		D V
services		W _
)		_ `
{

 	
services 
. 
AddSingleton !
<! "
ICategoryService" 2
,2 3
CategoryService4 C
>C D
(D E
)E F
;F G
services 
. 
AddSingleton !
<! "
IItemService" .
,. /
ItemService0 ;
>; <
(< =
)= >
;> ?
return 
services 
; 
} 	
} 
} ó
ûC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Entities\Category.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '
Entities' /
{ 
public 

record 
Category 
( 
int 
Id !
,! "
string# )
Name* .
,. /
Uri0 3
?3 4
Image5 :
,: ;
Category< D
?D E
ParentCategoryF T
)T U
{ 
internal 
static 

IValidator "
<" #
Category# +
>+ ,
	Validator- 6
=>7 9
new: =
CategoryValidator> O
(O P
)P Q
;Q R
}		 
}

 ®
öC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Entities\Item.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '
Entities' /
{ 
public 

record 
Item 
( 
int 
Id 
, 
string %
Name& *
,* +
string, 2
?2 3
Description4 ?
,? @
Uri 
? 
Image 
, 
Category 
Category %
,% &
decimal' .
Price/ 4
,4 5
int6 9
Amount: @
)@ A
{ 
internal		 
static		 

IValidator		 "
<		" #
Item		# '
>		' (
	Validator		) 2
=>		3 5
new		6 9
ItemValidator		: G
(		G H
)		H I
;		I J
}

 
} ”
´C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\EventArgs\ItemChangedEventArgs.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '
	EventArgs' 0
{ 
public 

class  
ItemChangedEventArgs %
:& '
System( .
.. /
	EventArgs/ 8
{ 
public 
Item 
? 
ChangedItem  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
? 
Correlation "
{# $
get% (
;( )
set* -
;- .
}/ 0
}		 
}

 ±
®C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Exceptions\CatalogException.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '

Exceptions' 1
{ 
public 

class 
CatalogException !
:" #
	Exception$ -
{ 
internal 
static 
CatalogException (
CategoryNotFound) 9
=>: <
new= @
CatalogExceptionA Q
(Q R
$strR f
)f g
;g h
internal 
static 
CatalogException (
ItemNotFound) 5
=>6 8
new9 <
CatalogException= M
(M N
$strN ^
)^ _
;_ `
public 
CatalogException 
(  
string  &
?& '
message( /
,/ 0
	Exception1 :
?: ;
innerException< J
)J K
:L M
baseN R
(R S
messageS Z
,Z [
innerException\ j
)j k
{		 	
} 	
public 
CatalogException 
(  
string  &
?& '
message( /
)/ 0
:1 2
base3 7
(7 8
message8 ?
)? @
{ 	
} 	
public 
CatalogException 
(  
)  !
:" #
base$ (
(( )
)) *
{ 	
} 	
} 
} ‹
´C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Interfaces\ICategoryRepository.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '

Interfaces' 1
{ 
public 

	interface 
ICategoryRepository (
{ 
Category 
? 
GetCategory 
( 
int !
id" $
)$ %
;% &
List 
< 
Category 
> 
GetAllCategories '
(' (
)( )
;) *
Category		 
AddCategory		 
(		 
Category		 %
category		& .
)		. /
;		/ 0
bool

 
UpdateCategory

 
(

 
Category

 $
category

% -
)

- .
;

. /
bool 
DeleteCategory 
( 
int 
id  "
)" #
;# $
} 
} Á
®C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Interfaces\ICategoryService.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '

Interfaces' 1
{ 
public 

	interface 
ICategoryService %
{ 
List 
< 
Category 
> 
GetCategories $
($ %
)% &
;& '
Category 
GetCategory 
( 
int  
id! #
)# $
;$ %
Category		 
AddCategory		 
(		 
Category		 %
category		& .
)		. /
;		/ 0
Category

 
AddCategory

 
(

 
string

 #
name

$ (
,

( )
Uri

* -
image

. 3
,

3 4
Category

5 =
parentCategory

> L
)

L M
;

M N
void 
UpdateCategory 
( 
int 
id  "
," #
string$ *
name+ /
,/ 0
Uri1 4
?4 5
image6 ;
,; <
Category= E
parentCategoryF T
)T U
;U V
void 
DeleteCategory 
( 
int 
id  "
)" #
;# $
} 
} î
ßC:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Interfaces\IItemRepository.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '

Interfaces' 1
{ 
public 

	interface 
IItemRepository $
{ 
Item 
GetItem 
( 
int 
id 
) 
; 
List 
< 
Item 
> 
GetAllItems 
( 
)  
;  !
Item		 
AddItem		 
(		 
Item		 
Item		 
)		 
;		  
bool

 

UpdateItem

 
(

 
Item

 
Item

 !
)

! "
;

" #
bool 

DeleteItem 
( 
int 
id 
) 
;  
} 
} †
§C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Interfaces\IItemService.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '

Interfaces' 1
{ 
public 

	interface 
IItemService !
{ 
event 
EventHandler 
<  
ItemChangedEventArgs /
>/ 0
OnItemChanged1 >
;> ?
List		 
<		 
Item		 
>		 
GetItems		 
(		 
)		 
;		 
Item

 
GetItem

 
(

 
int

 
id

 
)

 
;

 
Item 
AddItem 
( 
Item 
Item 
) 
;  
Item 
AddItem 
( 
string 
name  
,  !
string" (
?( )
description* 5
,5 6
Uri7 :
?: ;
image< A
,A B
Category 
category 
, 
decimal &
price' ,
,, -
int. 1
amount2 8
)8 9
;9 :
void 

UpdateItem 
( 
int 
id 
, 
string  &
name' +
,+ ,
string- 3
?3 4
description5 @
,@ A
UriB E
?E F
imageG L
,L M
Category 
category 
, 
decimal &
price' ,
,, -
int. 1
amount2 8
,8 9
string: @
?@ A
correlationB M
=N O
nullP T
)T U
;U V
void 

DeleteItem 
( 
int 
id 
) 
;  
} 
} Ö(
•C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Services\CategoryService.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '
Services' /
{ 
internal 
sealed 
class 
CategoryService )
:* +
ICategoryService, <
{ 
private		 
readonly		 
ICategoryRepository		 ,
_categoryRepository		- @
;		@ A
public 
CategoryService 
( 
ICategoryRepository 2
categoryRepository3 E
)E F
{ 	
_categoryRepository 
=  !
categoryRepository" 4
;4 5
} 	
public 
Category 
AddCategory #
(# $
Category$ ,
category- 5
)5 6
{ 	
FluentValidation 
. 
Results $
.$ %
ValidationResult% 5
validationResult6 F
=G H
CategoryI Q
.Q R
	ValidatorR [
.[ \
Validate\ d
(d e
categorye m
)m n
;n o
if 
( 
! 
validationResult !
.! "
IsValid" )
)) *
{ 
throw 
new 
CatalogException *
(* +
string+ 1
.1 2
Join2 6
(6 7
Environment7 B
.B C
NewLineC J
,J K
validationResultL \
.\ ]
Errors] c
.c d
Selectd j
(j k
ek l
=>m o
ep q
.q r
ErrorMessager ~
)~ 
)	 Ä
)
Ä Å
;
Å Ç
} 
return 
_categoryRepository &
.& '
AddCategory' 2
(2 3
category3 ;
); <
;< =
} 	
public 
Category 
AddCategory #
(# $
string$ *
name+ /
,/ 0
Uri1 4
image5 :
,: ;
Category< D
parentCategoryE S
)S T
{ 	
var 
category 
= 
new 
Category '
(' (
$num( )
,) *
name+ /
,/ 0
image1 6
,6 7
parentCategory8 F
)F G
;G H
return 
AddCategory 
( 
category '
)' (
;( )
} 	
public!! 
void!! 
DeleteCategory!! "
(!!" #
int!!# &
id!!' )
)!!) *
{"" 	
var## 
deleted## 
=## 
_categoryRepository## -
.##- .
DeleteCategory##. <
(##< =
id##= ?
)##? @
;##@ A
if$$ 
($$ 
!$$ 
deleted$$ 
)$$ 
{%% 
throw&& 
CatalogException&& &
.&&& '
CategoryNotFound&&' 7
;&&7 8
}'' 
}(( 	
public** 
List** 
<** 
Category** 
>** 
GetCategories** +
(**+ ,
)**, -
{++ 	
return,, 
_categoryRepository,, &
.,,& '
GetAllCategories,,' 7
(,,7 8
),,8 9
;,,9 :
}-- 	
public// 
Category// 
GetCategory// #
(//# $
int//$ '
id//( *
)//* +
{00 	
var11 
category11 
=11 
_categoryRepository11 .
.11. /
GetCategory11/ :
(11: ;
id11; =
)11= >
;11> ?
if22 
(22 
category22 
==22 
null22  
)22  !
{33 
throw44 
CatalogException44 &
.44& '
CategoryNotFound44' 7
;447 8
}55 
return77 
category77 
;77 
}88 	
public:: 
void:: 
UpdateCategory:: "
(::" #
int::# &
id::' )
,::) *
string::+ 1
name::2 6
,::6 7
Uri::8 ;
?::; <
image::= B
,::B C
Category::D L
parentCategory::M [
)::[ \
{;; 	
var<< 
category<< 
=<< 
new<< 
Category<< '
(<<' (
id<<( *
,<<* +
name<<, 0
,<<0 1
image<<2 7
,<<7 8
parentCategory<<9 G
)<<G H
;<<H I
_categoryRepository== 
.==  
UpdateCategory==  .
(==. /
category==/ 7
)==7 8
;==8 9
}>> 	
}?? 
}@@ †0
°C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Services\ItemService.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '
Services' /
{ 
internal 
sealed 
class 
ItemService %
:& '
IItemService( 4
{		 
private

 
readonly

 
IItemRepository

 (
_itemRepository

) 8
;

8 9
public 
event 
EventHandler !
<! " 
ItemChangedEventArgs" 6
>6 7
OnItemChanged8 E
;E F
public 
ItemService 
( 
IItemRepository *
itemRepository+ 9
)9 :
{ 	
_itemRepository 
= 
itemRepository ,
;, -
} 	
public 
Item 
AddItem 
( 
Item  
Item! %
)% &
{ 	
FluentValidation 
. 
Results $
.$ %
ValidationResult% 5
validationResult6 F
=G H
ItemI M
.M N
	ValidatorN W
.W X
ValidateX `
(` a
Itema e
)e f
;f g
if 
( 
! 
validationResult !
.! "
IsValid" )
)) *
{ 
throw 
new 
CatalogException *
(* +
string+ 1
.1 2
Join2 6
(6 7
Environment7 B
.B C
NewLineC J
,J K
validationResultL \
.\ ]
Errors] c
.c d
Selectd j
(j k
ek l
=>m o
ep q
.q r
ErrorMessager ~
)~ 
)	 Ä
)
Ä Å
;
Å Ç
} 
return 
_itemRepository "
." #
AddItem# *
(* +
Item+ /
)/ 0
;0 1
} 	
public 
Item 
AddItem 
( 
string "
name# '
,' (
string) /
?/ 0
description1 <
,< =
Uri> A
?A B
imageC H
,H I
CategoryJ R
categoryS [
,[ \
decimal] d
pricee j
,j k
intl o
amountp v
)v w
{ 	
var   
Item   
=   
new   
Item   
(    
$num    !
,  ! "
name  # '
,  ' (
description  ) 4
,  4 5
image  6 ;
,  ; <
category  = E
,  E F
price  G L
,  L M
amount  N T
)  T U
;  U V
return!! 
AddItem!! 
(!! 
Item!! 
)!!  
;!!  !
}"" 	
public$$ 
void$$ 

DeleteItem$$ 
($$ 
int$$ "
id$$# %
)$$% &
{%% 	
var&& 
deleted&& 
=&& 
_itemRepository&& )
.&&) *

DeleteItem&&* 4
(&&4 5
id&&5 7
)&&7 8
;&&8 9
if'' 
('' 
!'' 
deleted'' 
)'' 
{(( 
throw)) 
CatalogException)) &
.))& '
ItemNotFound))' 3
;))3 4
}** 
}++ 	
public-- 
List-- 
<-- 
Item-- 
>-- 
GetItems-- "
(--" #
)--# $
{.. 	
return// 
_itemRepository// "
.//" #
GetAllItems//# .
(//. /
)/// 0
;//0 1
}00 	
public22 
Item22 
GetItem22 
(22 
int22 
id22  "
)22" #
{33 	
var44 
Item44 
=44 
_itemRepository44 &
.44& '
GetItem44' .
(44. /
id44/ 1
)441 2
;442 3
if55 
(55 
Item55 
==55 
null55 
)55 
{66 
throw77 
CatalogException77 &
.77& '
ItemNotFound77' 3
;773 4
}88 
return:: 
Item:: 
;:: 
};; 	
public== 
void== 

UpdateItem== 
(== 
int== "
id==# %
,==% &
string==' -
name==. 2
,==2 3
string==4 :
?==: ;
description==< G
,==G H
Uri==I L
?==L M
image==N S
,==S T
Category==U ]
category==^ f
,==f g
decimal==h o
price==p u
,==u v
int==w z
amount	=={ Å
,
==Å Ç
string
==É â
?
==â ä
correlation
==ã ñ
=
==ó ò
null
==ô ù
)
==ù û
{>> 	
var?? 
item?? 
=?? 
new?? 
Item?? 
(??  
id??  "
,??" #
name??$ (
,??( )
description??* 5
,??5 6
image??7 <
,??< =
category??> F
,??F G
price??H M
,??M N
amount??O U
)??U V
;??V W
_itemRepository@@ 
.@@ 

UpdateItem@@ &
(@@& '
item@@' +
)@@+ ,
;@@, -
OnItemChangedAA 
?AA 
.AA 
InvokeAA !
(AA! "
thisAA" &
,AA& '
newAA( + 
ItemChangedEventArgsAA, @
{AAA B
ChangedItemAAC N
=AAO P
itemAAQ U
,AAU V
CorrelationAAW b
=AAc d
correlationAAe p
}AAq r
)AAr s
;AAs t
}BB 	
}DD 
}EE ¡
©C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Validators\CategoryValidator.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '

Validators' 1
{ 
internal 
sealed 
class 
CategoryValidator +
:, -
AbstractValidator. ?
<? @
Category@ H
>H I
{ 
public 
CategoryValidator  
(  !
)! "
{		 	
RuleFor

 
(

 
c

 
=>

 
c
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
.

+ ,
MaximumLength

, 9
(

9 :
$num

: <
)

< =
;

= >
} 	
} 
} 
•C:\workspace\dotNet mentoring advanced 2022\repo\dotnet-advanced-mentoring-2022-2023\dotNetMentoringAdvanced\CatalogService.BusinessLayer\Validators\ItemValidator.cs
	namespace 	
CatalogService
 
. 
BusinessLayer &
.& '

Validators' 1
{ 
internal 
sealed 
class 
ItemValidator '
:( )
AbstractValidator* ;
<; <
Item< @
>@ A
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
.

+ ,
MaximumLength

, 9
(

9 :
$num

: <
)

< =
;

= >
RuleFor 
( 
x 
=> 
x 
. 
Category #
)# $
.$ %
NotEmpty% -
(- .
). /
;/ 0
RuleFor 
( 
x 
=> 
x 
. 
Price  
)  !
.! " 
GreaterThanOrEqualTo" 6
(6 7
$num7 8
)8 9
;9 :
RuleFor 
( 
x 
=> 
x 
. 
Amount !
)! "
." # 
GreaterThanOrEqualTo# 7
(7 8
$num8 9
)9 :
;: ;
} 	
} 
} 