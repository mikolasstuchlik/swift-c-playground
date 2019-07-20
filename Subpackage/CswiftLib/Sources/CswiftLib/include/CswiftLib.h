#ifndef C_SWIFT_LIB_H
#define C_SWIFT_LIB_H

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>
#include <malloc.h>

#ifndef __clang__ 

#define _Nonnull
#define _Nullable
#define _Null_unspecified

#endif

enum WeekDay{
    mon, tue, wen, thu, fri, sat, sun
};

struct Employee{
    char const * _Nullable first_name;
    char * _Nullable last_name;
    bool is_married;
    uint64_t salary;

    uint64_t citizen_id;
};

typedef bool (*HireEmployee)(struct Employee);
typedef struct Employee (*FireEmployee)(uint64_t);

struct Company{
    struct Employee * _Nonnull employees;
    uint16_t employees_length;

    HireEmployee _Nonnull hire_employee;
    FireEmployee _Nonnull fire_employee;
};

union MyProperty{
    uint8_t total_friend_debt[8];
    uint64_t total_debt;
};

struct MyError{
    char * _Nonnull description;
    int code;
};

void greetMe();

void no_params_no_return();
int no_params_int_return();

struct Employee some_params_struct_return(uint64_t citizen_id);
uint64_t struct_params_type_return(struct  Employee employee);
uint64_t struct_pointer_param_type_return(struct Employee * _Nullable employee_pointer);

void copy_employee_to_heap(struct Employee source, struct Employee * _Nullable * _Nullable destination);

void print_employee(struct Employee employee);

void test_block(uint64_t a_number, void (* _Nonnull block)(uint64_t));

#endif /* C_SWIFT_LIB_H */
