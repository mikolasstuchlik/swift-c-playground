#include "include/CswiftLib.h"
#include <string.h>

void greetMe() {
    printf("My name is CSwiftLib \n");
}


void no_params_no_return(){}
int no_params_int_return(){ return 10; }

struct Employee some_params_struct_return(uint64_t citizen_id){
    struct Employee new_employee;

    new_employee.citizen_id = citizen_id;
    new_employee.first_name = NULL;
    new_employee.last_name = NULL;
    new_employee.salary = 0;
    new_employee.is_married = false;
    
    return new_employee;
}

uint64_t struct_params_type_return(struct  Employee employee){
    return employee.citizen_id;
}

uint64_t struct_pointer_param_type_return(struct Employee *employee_pointer){
    return employee_pointer->citizen_id;
}

void copy_employee_to_heap(struct Employee source, struct Employee **destination){
    if (destination == NULL) {
        return;
    }
    
    *destination = malloc(sizeof(struct Employee));
    if (*destination == NULL){
        return;
    }

    (*destination)->citizen_id = source.citizen_id;
    (*destination)->salary = source.salary;
    (*destination)->is_married = source.is_married;

    (*destination)->first_name = NULL;
    (*destination)->last_name = NULL;

    if (source.first_name != NULL) {
        (*destination)->first_name = strdup(source.first_name);
    }

    if (source.last_name != NULL) {
        (*destination)->last_name = strdup(source.last_name);
    }    
}

void print_employee(struct Employee employee){
    printf("Struct Employee: (");

    printf("citizen_id: %lu; ", employee.citizen_id);

    if (employee.first_name != NULL){
        printf("first_name: %s; ", employee.first_name);
    } else {
        printf("first_name: <NULL>; ");
    }

    if (employee.last_name != NULL){
        printf("last_name: %s; ", employee.last_name);
    } else {
        printf("last_name: <NULL>; ");
    }

    printf("salary: %lu; ", employee.salary);

    if (employee.is_married == true) {
        printf("<married>");
    } else {
        printf("<single>");
    }

    printf(")\n");
}