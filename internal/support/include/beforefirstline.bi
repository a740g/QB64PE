'==========================================================================
' This file is automatically included in each compiled program right before
' the first program line, so to say it becomes line zero of each program.
'----------
' The purpose of this file is to implement common stuff into the language,
' such as constants or type definitions. For this purpose this file allows
' names beginning with an underscroe, which is usually not possible. However,
' some rules have to be followed in order to avoid conflicts with user code.
'----------
' IMPORTANT
'   The use of this file is exclusively reserved to QB64-PE itself,
'   do NOT add your own personal stuff here !!
'----------
' RULES
'   1.) Everything must be prepared to work with OPTION _EXPLICIT in effect,
'       that is because this file is included in every tiny program and we
'       never know if the user has OPTION _EXPLICIT set or not.
'   2.) All used CONST, SUB/FUNCTION, TYPE and variable names must begin
'       with an underscore, that is because those may conflict with CONST
'       names. E.g. write a simple xyz = 123 here and it will throw an error
'       as soon as the user defines a CONST xyz = ... in the global scope.
'   3.) Exceptions from rule #2 are $LET variables, UDT elements and labels
'       for GOTO/GOSUB etc., just choose unique names for it. However, if
'       in doubt, a leading underscore can be used here too.
' It's strongly recommended to edit this file in the QB64-PE editor only.
' The IDE got adapted to automatically enforce the above rules whenever it
' detects this file is loaded into the editor. I.e. it automatically enables
' OPTION _EXPLICIT and it will throw "Invalid name" or "Invalid variable"
' errors when missing a leading underscore.
'==========================================================================

$INCLUDEONCE

'Boolean values
CONST _TRUE = -1, _FALSE = 0
'Relations (e.g. SGN and _STRCMP, _STRICMP)
CONST _LESS = -1, _EQUAL = 0, _GREATER = 1
'Special values
CONST _NULL = 0
CONST _STRING_EMPTY = ""
CONST _STRING_NULL = CHR$(_NULL)
CONST _E## = EXP(1.0##)

'Base time values
CONST _SECS_IN_MIN = 60, _MINS_IN_HOUR = 60, _HOURS_IN_DAY = 24
CONST _DAYS_IN_WEEK = 7, _DAYS_IN_YEAR = 365
'Derived time values
CONST _SECS_IN_HOUR = _MINS_IN_HOUR * _SECS_IN_MIN
CONST _SECS_IN_DAY = _HOURS_IN_DAY * _SECS_IN_HOUR
CONST _SECS_IN_WEEK = _DAYS_IN_WEEK * _SECS_IN_DAY
CONST _SECS_IN_YEAR = _DAYS_IN_YEAR * _SECS_IN_DAY
CONST _SECS_IN_LEAPYEAR = _SECS_IN_YEAR + _SECS_IN_DAY
CONST _MINS_IN_DAY = _HOURS_IN_DAY * _MINS_IN_HOUR
CONST _MINS_IN_WEEK = _DAYS_IN_WEEK * _MINS_IN_DAY
CONST _MINS_IN_YEAR = _DAYS_IN_YEAR * _MINS_IN_DAY
CONST _MINS_IN_LEAPYEAR = _MINS_IN_YEAR + _MINS_IN_DAY
CONST _HOURS_IN_WEEK = _DAYS_IN_WEEK * _HOURS_IN_DAY
CONST _HOURS_IN_YEAR = _DAYS_IN_YEAR * _HOURS_IN_DAY
CONST _HOURS_IN_LEAPYEAR = _HOURS_IN_YEAR + _HOURS_IN_DAY
CONST _DAYS_IN_LEAPYEAR = _DAYS_IN_YEAR + 1
CONST _WEEKS_IN_YEAR = _DAYS_IN_YEAR / _DAYS_IN_WEEK
CONST _WEEKS_IN_LEAPYEAR = _DAYS_IN_LEAPYEAR / _DAYS_IN_WEEK

'Binary size factors
CONST _ONE_KB = 1024 '            ' 2^10
CONST _ONE_MB = _ONE_KB * _ONE_KB ' 2^20
CONST _ONE_GB = _ONE_MB * _ONE_KB ' 2^30
CONST _ONE_TB = _ONE_GB * _ONE_KB ' 2^40
CONST _ONE_PB = _ONE_TB * _ONE_KB ' 2^50
CONST _ONE_EB = _ONE_PB * _ONE_KB ' 2^60

'Sizes of elementary integer types (in bytes)
CONST _SIZE_OF_BYTE = 1
CONST _SIZE_OF_INTEGER = 2
CONST _SIZE_OF_LONG = 4
CONST _SIZE_OF_INTEGER64 = 8
'Sizes of elementary floating point types (in bytes)
CONST _SIZE_OF_SINGLE = 4
CONST _SIZE_OF_DOUBLE = 8
CONST _SIZE_OF_FLOAT = 32
'Sizes of elementary pointer types (in bytes)
$IF 32BIT THEN
    CONST _SIZE_OF_OFFSET = 4
$ELSE
    CONST _SIZE_OF_OFFSET = 8
$END IF

'Limits of elementary integer types (min/max values)
CONST _BIT_MIN` = -1, _BIT_MAX` = 0
CONST _UBIT_MIN~` = 0, _UBIT_MAX~` = 1
CONST _BYTE_MIN%% = -128, _BYTE_MAX%% = 127
CONST _UBYTE_MIN~%% = 0, _UBYTE_MAX~%% = 255
CONST _INTEGER_MIN% = -32768, _INTEGER_MAX% = 32767
CONST _UINTEGER_MIN~% = 0, _UINTEGER_MAX~% = 65535
CONST _LONG_MIN& = -2147483648, _LONG_MAX& = 2147483647
CONST _ULONG_MIN~& = 0, _ULONG_MAX~& = 4294967295
CONST _INTEGER64_MIN&& = -9223372036854775808, _INTEGER64_MAX&& = 9223372036854775807
CONST _UINTEGER64_MIN~&& = 0, _UINTEGER64_MAX~&& = 18446744073709551615
'Limits of elementary floating point types (min/max values)
CONST _SINGLE_MIN! = -3.402823E+38, _SINGLE_MAX! = 3.402823E+38
CONST _DOUBLE_MIN# = -1.797693134862315D+308, _DOUBLE_MAX# = 1.797693134862315D+308
CONST _FLOAT_MIN## = -1.189731495357231765F+4932, _FLOAT_MAX## = 1.189731495357231765F+4932
'Limits of elementary pointer types (min/max values)
$IF 32BIT THEN
    CONST _OFFSET_MIN& = -2147483648, _OFFSET_MAX& = 2147483647
    CONST _UOFFSET_MIN~& = 0, _UOFFSET_MAX~& = 4294967295
$ELSE
    CONST _OFFSET_MIN&& = -9223372036854775808, _OFFSET_MAX&& = 9223372036854775807
    CONST _UOFFSET_MIN~&& = 0, _UOFFSET_MAX~&& = 18446744073709551615
$END IF

'ASCII codes
CONST _ASC_SPACE = 32
CONST _ASC_EXCLAMATION = 33 '        !
CONST _ASC_QUOTE = 34 '              "
CONST _ASC_HASH = 35 '               #
CONST _ASC_DOLLAR = 36 '             $
CONST _ASC_PERCENT = 37 '            %
CONST _ASC_AMPERSAND = 38 '          &
CONST _ASC_APOSTROPHE = 39 '         '
CONST _ASC_LEFTBRACKET = 40 '        (
CONST _ASC_RIGHTBRACKET = 41 '       )
CONST _ASC_ASTERISK = 42 '           *
CONST _ASC_PLUS = 43 '               +
CONST _ASC_COMMA = 44 '              ,
CONST _ASC_MINUS = 45 '              -
CONST _ASC_FULLSTOP = 46 '           .
CONST _ASC_FORWARDSLASH = 47 '       /
CONST _ASC_COLON = 58 '              :
CONST _ASC_SEMICOLON = 59 '          ;
CONST _ASC_LESSTHAN = 60 '           <
CONST _ASC_EQUAL = 61 '              =
CONST _ASC_GREATERTHAN = 62 '        >
CONST _ASC_QUESTION = 63 '           ?
CONST _ASC_ATSIGN = 64 '             @
CONST _ASC_LEFTSQUAREBRACKET = 91 '  [
CONST _ASC_BACKSLASH = 92 '          \
CONST _ASC_RIGHTSQUAREBRACKET = 93 ' ]
CONST _ASC_CARET = 94 '              ^
CONST _ASC_UNDERSCORE = 95 '         _
CONST _ASC_GRAVE = 96 '              `
CONST _ASC_LEFTCURLYBRACKET = 123 '  {
CONST _ASC_VERTICALBAR = 124 '       |
CONST _ASC_RIGHTCURLYBRACKET = 125 ' }
CONST _ASC_TILDE = 126 '             ~

'_KEYDOWN/_KEYHIT codes
CONST _KEY_LSHIFT = 100304, _KEY_RSHIFT = 100303
CONST _KEY_LCTRL = 100306, _KEY_RCTRL = 100305
CONST _KEY_LALT = 100308, _KEY_RALT = 100307
CONST _KEY_LAPPLE = 100310, _KEY_RAPPLE = 100309
CONST _KEY_F1 = 15104, _KEY_F2 = 15360, _KEY_F3 = 15616, _KEY_F4 = 15872
CONST _KEY_F5 = 16128, _KEY_F6 = 16384, _KEY_F7 = 16640, _KEY_F8 = 16896
CONST _KEY_F9 = 17152, _KEY_F10 = 17408, _KEY_F11 = 34048, _KEY_F12 = 34304
CONST _KEY_INSERT = 20992, _KEY_DELETE = 21248
CONST _KEY_HOME = 18176, _KEY_END = 20224
CONST _KEY_PAGEUP = 18688, _KEY_PAGEDOWN = 20736
CONST _KEY_LEFT = 19200, _KEY_RIGHT = 19712, _KEY_UP = 18432, _KEY_DOWN = 20480
CONST _KEY_BACKSPACE = 8, _KEY_TAB = 9, _KEY_ENTER = 13, _KEY_ESC = 27

'ERROR codes (ERROR n triggers an error, n = ERR will return the last occurred error)
CONST _ERR_NONE = 0 'for compare with ERR only !!
CONST _ERR_NEXT_WITHOUT_FOR = 1
CONST _ERR_SYNTAX_ERROR = 2
CONST _ERR_RETURN_WITHOUT_GOSUB = 3
CONST _ERR_OUT_OF_DATA = 4
CONST _ERR_ILLEGAL_FUNCTION_CALL = 5
CONST _ERR_OVERFLOW = 6
CONST _ERR_OUT_OF_MEMORY = 7
CONST _ERR_LABEL_NOT_DEFINED = 8
CONST _ERR_SUBSCRIPT_OUT_OF_RANGE = 9
CONST _ERR_DUPLICATE_DEFINITION = 10
CONST _ERR_DIVISION_BY_ZERO = 11
CONST _ERR_ILLEGAL_IN_DIRECT_MODE = 12
CONST _ERR_TYPE_MISMATCH = 13
CONST _ERR_OUT_OF_STRING_SPACE = 14
CONST _ERR_STRING_FORMULA_TOO_COMPLEX = 16
CONST _ERR_CANNOT_CONTINUE = 17
CONST _ERR_FUNCTION_NOT_DEFINED = 18
CONST _ERR_NO_RESUME = 19
CONST _ERR_RESUME_WITHOUT_ERROR = 20
CONST _ERR_DEVICE_TIMEOUT = 24
CONST _ERR_DEVICE_FAULT = 25
CONST _ERR_FOR_WITHOUT_NEXT = 26
CONST _ERR_OUT_OF_PAPER = 27
CONST _ERR_WHILE_WITHOUT_WEND = 29
CONST _ERR_WEND_WITHOUT_WHILE = 30
CONST _ERR_DUPLICATE_LABEL = 33
CONST _ERR_SUBPROGRAM_NOT_DEFINED = 35
CONST _ERR_ARGUMENT_COUNT_MISMATCH = 37
CONST _ERR_ARRAY_NOT_DEFINED = 38
CONST _ERR_VARIABLE_REQUIRED = 40
CONST _ERR_FIELD_OVERFLOW = 50
CONST _ERR_INTERNAL_ERROR = 51
CONST _ERR_BAD_FILE_NAME_OR_NUMBER = 52
CONST _ERR_FILE_NOT_FOUND = 53
CONST _ERR_BAD_FILE_MODE = 54
CONST _ERR_FILE_ALREADY_OPEN = 55
CONST _ERR_FIELD_STATEMENT_ACTIVE = 56
CONST _ERR_DEVICE_IO_ERROR = 57
CONST _ERR_FILE_ALREADY_EXISTS = 58
CONST _ERR_BAD_RECORD_LENGTH = 59
CONST _ERR_DISK_FULL = 61
CONST _ERR_INPUT_PAST_END_OF_FILE = 62
CONST _ERR_BAD_RECORD_NUMBER = 63
CONST _ERR_BAD_FILE_NAME = 64
CONST _ERR_TOO_MANY_FILES = 67
CONST _ERR_DEVICE_UNAVAILABLE = 68
CONST _ERR_COMMUNICATION_BUFFER_OVERFLOW = 69
CONST _ERR_PERMISSION_DENIED = 70
CONST _ERR_DISK_NOT_READY = 71
CONST _ERR_DISK_MEDIA_ERROR = 72
CONST _ERR_FEATURE_UNAVAILABLE = 73
CONST _ERR_RENAME_ACROSS_DISKS = 74
CONST _ERR_PATH_FILE_ACCESS_ERROR = 75
CONST _ERR_PATH_NOT_FOUND = 76
CONST _ERR_INVALID_HANDLE = 258

