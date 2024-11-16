
DIM SHARED ISSTRING AS LONG
DIM SHARED ISFLOAT AS LONG
DIM SHARED ISUNSIGNED AS LONG
DIM SHARED ISPOINTER AS LONG
DIM SHARED ISFIXEDLENGTH AS LONG
DIM SHARED ISINCONVENTIONALMEMORY AS LONG
DIM SHARED ISOFFSETINBITS AS LONG
DIM SHARED ISARRAY AS LONG
DIM SHARED ISREFERENCE AS LONG
DIM SHARED ISUDT AS LONG
DIM SHARED ISOFFSET AS LONG

DIM SHARED STRINGTYPE AS LONG
DIM SHARED BITTYPE AS LONG
DIM SHARED UBITTYPE AS LONG
DIM SHARED BYTETYPE AS LONG
DIM SHARED UBYTETYPE AS LONG
DIM SHARED INTEGERTYPE AS LONG
DIM SHARED UINTEGERTYPE AS LONG
DIM SHARED LONGTYPE AS LONG
DIM SHARED ULONGTYPE AS LONG
DIM SHARED INTEGER64TYPE AS LONG
DIM SHARED UINTEGER64TYPE AS LONG
DIM SHARED SINGLETYPE AS LONG
DIM SHARED DOUBLETYPE AS LONG
DIM SHARED FLOATTYPE AS LONG
DIM SHARED OFFSETTYPE AS LONG
DIM SHARED UOFFSETTYPE AS LONG
DIM SHARED UDTTYPE AS LONG

ISSTRING = 1073741824
ISFLOAT = 536870912
ISUNSIGNED = 268435456
ISPOINTER = 134217728
ISFIXEDLENGTH = 67108864 'only set for strings with pointer flag
ISINCONVENTIONALMEMORY = 33554432
ISOFFSETINBITS = 16777216
ISARRAY = 8388608
ISREFERENCE = 4194304
ISUDT = 2097152
ISOFFSET = 1048576

STRINGTYPE = ISSTRING + ISPOINTER
BITTYPE = 1& + ISPOINTER + ISOFFSETINBITS
UBITTYPE = 1& + ISPOINTER + ISUNSIGNED + ISOFFSETINBITS 'QB64 will also support _BIT*n, eg. DIM bitarray[10] AS _UNSIGNED _BIT*10
BYTETYPE = 8& + ISPOINTER
UBYTETYPE = 8& + ISPOINTER + ISUNSIGNED
INTEGERTYPE = 16& + ISPOINTER
UINTEGERTYPE = 16& + ISPOINTER + ISUNSIGNED
LONGTYPE = 32& + ISPOINTER
ULONGTYPE = 32& + ISPOINTER + ISUNSIGNED
INTEGER64TYPE = 64& + ISPOINTER
UINTEGER64TYPE = 64& + ISPOINTER + ISUNSIGNED
SINGLETYPE = 32& + ISFLOAT + ISPOINTER
DOUBLETYPE = 64& + ISFLOAT + ISPOINTER
FLOATTYPE = 256& + ISFLOAT + ISPOINTER '8-32 bytes
OFFSETTYPE = 64& + ISOFFSET + ISPOINTER: IF OS_BITS = 32 THEN OFFSETTYPE = 32& + ISOFFSET + ISPOINTER
UOFFSETTYPE = 64& + ISOFFSET + ISUNSIGNED + ISPOINTER: IF OS_BITS = 32 THEN UOFFSETTYPE = 32& + ISOFFSET + ISUNSIGNED + ISPOINTER
UDTTYPE = ISUDT + ISPOINTER

REDIM SHARED udtxname(1000) AS STRING * 256
REDIM SHARED udtxcname(1000) AS STRING * 256
REDIM SHARED udtxsize(1000) AS LONG
REDIM SHARED udtxnext(1000) AS LONG
REDIM SHARED udtxvariable(1000) AS INTEGER 'true if the udt contains variable length elements
'elements
REDIM SHARED udtename(1000) AS STRING * 256
REDIM SHARED udtecname(1000) AS STRING * 256
REDIM SHARED udtesize(1000) AS LONG
REDIM SHARED udtetype(1000) AS LONG
REDIM SHARED udtetypesize(1000) AS LONG
REDIM SHARED udtearrayelements(1000) AS LONG
REDIM SHARED udtenext(1000) AS LONG

