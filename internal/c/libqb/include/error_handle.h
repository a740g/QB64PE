#ifndef INCLUDE_LIBQB_ERROR_HANDLE_H
#define INCLUDE_LIBQB_ERROR_HANDLE_H

#include "qbs.h"
#include <stdint.h>

void error(int32_t error_number);
void fix_error();

// FIXME: Should be removed in the future, use `is_error_pending()`.
//
// Some spots edit this directly to clear/restore an error, those sites should
// be examined for the best solution.
extern uint32_t new_error;
extern uint32_t error_err;
extern uint32_t error_occurred;
extern uint32_t error_goto_line;
extern qbs *error_handler_history;
extern uint32_t error_handling;
extern uint32_t error_retry;

static inline bool is_error_pending() { return new_error != 0; }

void clear_error();

double get_error_erl();
uint32_t get_error_err();

int32_t func__errorline();
int32_t func__inclerrorline();
qbs *func__inclerrorfile();
qbs *func__errormessage(int32_t errorcode, int32_t passed);

void error_set_line(uint32_t errorline, uint32_t incerrorline, const char *incfilename);

#define QB_ERROR_NEXT_WITHOUT_FOR 1
#define QB_ERROR_SYNTAX_ERROR 2
#define QB_ERROR_RETURN_WITHOUT_GOSUB 3
#define QB_ERROR_OUT_OF_DATA 4
#define QB_ERROR_ILLEGAL_FUNCTION_CALL 5
#define QB_ERROR_OVERFLOW 6
#define QB_ERROR_OUT_OF_MEMORY 7
#define QB_ERROR_LABEL_NOT_DEFINED 8
#define QB_ERROR_SUBSCRIPT_OUT_OF_RANGE 9
#define QB_ERROR_DUPLICATE_DEFINITION 10
#define QB_ERROR_DIVISION_BY_ZERO 11
#define QB_ERROR_ILLEGAL_IN_DIRECT_MODE 12
#define QB_ERROR_TYPE_MISMATCH 13
#define QB_ERROR_OUT_OF_STRING_SPACE 14
#define QB_ERROR_STRING_FORMULA_TOO_COMPLEX 16
#define QB_ERROR_CANNOT_CONTINUE 17
#define QB_ERROR_FUNCTION_NOT_DEFINED 18
#define QB_ERROR_NO_RESUME 19
#define QB_ERROR_RESUME_WITHOUT_ERROR 20
#define QB_ERROR_DEVICE_TIMEOUT 24
#define QB_ERROR_DEVICE_FAULT 25
#define QB_ERROR_FOR_WITHOUT_NEXT 26
#define QB_ERROR_OUT_OF_PAPER 27
#define QB_ERROR_WHILE_WITHOUT_WEND 29
#define QB_ERROR_WEND_WITHOUT_WHILE 30
#define QB_ERROR_DUPLICATE_LABEL 33
#define QB_ERROR_SUBPROGRAM_NOT_DEFINED 35
#define QB_ERROR_ARGUMENT_COUNT_MISMATCH 37
#define QB_ERROR_ARRAY_NOT_DEFINED 38
#define QB_ERROR_VARIABLE_REQUIRED 40
#define QB_ERROR_FIELD_OVERFLOW 50
#define QB_ERROR_INTERNAL_ERROR 51
#define QB_ERROR_BAD_FILE_NAME_OR_NUMBER 52
#define QB_ERROR_FILE_NOT_FOUND 53
#define QB_ERROR_BAD_FILE_MODE 54
#define QB_ERROR_FILE_ALREADY_OPEN 55
#define QB_ERROR_FIELD_STATEMENT_ACTIVE 56
#define QB_ERROR_DEVICE_IO_ERROR 57
#define QB_ERROR_FILE_ALREADY_EXISTS 58
#define QB_ERROR_BAD_RECORD_LENGTH 59
#define QB_ERROR_DISK_FULL 61
#define QB_ERROR_INPUT_PAST_END_OF_FILE 62
#define QB_ERROR_BAD_RECORD_NUMBER 63
#define QB_ERROR_BAD_FILE_NAME 64
#define QB_ERROR_TOO_MANY_FILES 67
#define QB_ERROR_DEVICE_UNAVAILABLE 68
#define QB_ERROR_COMMUNICATION_BUFFER_OVERFLOW 69
#define QB_ERROR_PERMISSION_DENIED 70
#define QB_ERROR_DISK_NOT_READY 71
#define QB_ERROR_DISK_MEDIA_ERROR 72
#define QB_ERROR_FEATURE_UNAVAILABLE 73
#define QB_ERROR_RENAME_ACROSS_DISKS 74
#define QB_ERROR_PATH_FILE_ACCESS_ERROR 75
#define QB_ERROR_PATH_NOT_FOUND 76
#define QB_ERROR_OUT_OF_STACK_SPACE 256
#define QB_ERROR_OUT_OF_MEMORY_FATAL 257
#define QB_ERROR_INVALID_HANDLE 258
#define QB_ERROR_CANNOT_FIND_DYNAMIC_LIBRARY_FILE 259
#define QB_ERROR_FUNCTION_NOT_FOUND_IN_DYNAMIC_LIBRARY 260
#define QB_ERROR_FUNCTION_NOT_FOUND_IN_DYNAMIC_LIBRARY_261 261
#define QB_ERROR_GL_COMMAND_OUTSIDE_SUB_GL_SCOPE 270
#define QB_ERROR_END_SYSTEM_IN_SUB_GL_SCOPE 271
#define QB_ERROR_MEMORY_REGION_OUT_OF_RANGE 300
#define QB_ERROR_INVALID_SIZE 301
#define QB_ERROR_SOURCE_MEMORY_REGION_OUT_OF_RANGE 302
#define QB_ERROR_DESTINATION_MEMORY_REGION_OUT_OF_RANGE 303
#define QB_ERROR_BOTH_MEMORY_REGIONS_OUT_OF_RANGE 304
#define QB_ERROR_SOURCE_MEMORY_FREED 305
#define QB_ERROR_DESTINATION_MEMORY_FREED 306
#define QB_ERROR_MEMORY_ALREADY_FREED 307
#define QB_ERROR_MEMORY_HAS_BEEN_FREED 308
#define QB_ERROR_MEMORY_NOT_INITIALIZED 309
#define QB_ERROR_SOURCE_MEMORY_NOT_INITIALIZED 310
#define QB_ERROR_DESTINATION_MEMORY_NOT_INITIALIZED 311
#define QB_ERROR_BOTH_MEMORY_NOT_INITIALIZED 312
#define QB_ERROR_BOTH_MEMORY_FREED 313
#define QB_ERROR_ASSERT_FAILED 314
#define QB_ERROR_ASSERT_FAILED_WITH_DESCRIPTION 315
#define QB_ERROR_OUT_OF_MEMORY_FATAL_502 502
#define QB_ERROR_OUT_OF_MEMORY_FATAL_503 503
#define QB_ERROR_OUT_OF_MEMORY_FATAL_504 504
#define QB_ERROR_OUT_OF_MEMORY_FATAL_505 505
#define QB_ERROR_OUT_OF_MEMORY_FATAL_506 506
#define QB_ERROR_OUT_OF_MEMORY_FATAL_507 507
#define QB_ERROR_OUT_OF_MEMORY_FATAL_508 508
#define QB_ERROR_OUT_OF_MEMORY_FATAL_509 509
#define QB_ERROR_OUT_OF_MEMORY_FATAL_510 510
#define QB_ERROR_OUT_OF_MEMORY_FATAL_511 511
#define QB_ERROR_OUT_OF_MEMORY_FATAL_512 512
#define QB_ERROR_OUT_OF_MEMORY_FATAL_513 513
#define QB_ERROR_OUT_OF_MEMORY_FATAL_514 514
#define QB_ERROR_OUT_OF_MEMORY_FATAL_515 515
#define QB_ERROR_OUT_OF_MEMORY_FATAL_516 516
#define QB_ERROR_OUT_OF_MEMORY_FATAL_517 517
#define QB_ERROR_OUT_OF_MEMORY_FATAL_518 518

#endif
