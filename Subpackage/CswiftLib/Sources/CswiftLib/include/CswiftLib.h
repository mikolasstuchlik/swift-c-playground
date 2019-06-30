#ifndef C_SWIFT_LIB_H
#define C_SWIFT_LIB_H

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

enum WeekDay{
    mon, tue, wen, thu, fri, sat, sun
};

struct Employee{
    char *first_name;
    char *last_name;
    bool is_married;
    uint64_t salary;

    uint64_t citizen_id;
};

typedef bool (*HireEmployee)(struct Employee);
typedef struct Employee (*FireEmployee)(uint64_t);

struct Company{
    struct Employee *employees;
    uint16_t employees_length;

    HireEmployee hire_employee;
    FireEmployee fire_employee;
};

union MyProperty{
    struct Company companyOwned;
    uint64_t total_debt;
};

struct MyError{
    char *description;
    int code;
};

void greetMe();

void no_params_no_return();
int no_params_int_return();

struct Employee some_params_struct_return(uint64_t citizen_id);
uint64_t struct_params_type_return(struct  Employee employee);
uint64_t struct_pointer_param_type_return(struct Employee *employee_pointer);

void copy_employee_to_heap(struct Employee source, struct Employee **destination);

#endif /* C_SWIFT_LIB_H */
