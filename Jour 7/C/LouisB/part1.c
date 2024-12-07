#include <stdio.h>
#include <stdint.h>

#define _INPUT_FILE_PATH "C:\\Users\\loulo\\Documents\\cpp\\advent of code\\Jour 7\\input.txt"

int test_actual(int* op, uint64_t* val, int len)
{
    uint64_t res = val[1];
    for (int i=0; i<len-2; i++) {
        if (op[i+1]) {
            res += val[2+i];
        } else {
            res *= val[2+i];
        }
    }
    if (res == val[0]) {
        return 1;
    } else {
        return 0;
    }
}

int test_unit(int n, int* op, uint64_t* val, int len) {
    int res = 0;

    if (n == 1) {
        op[n] = 0;
        res += test_actual(op, val, len);
        op[n] = 1;
        res += test_actual(op, val, len);
    } else {
        op[n] = 0;
        res += test_unit(n-1, op, val, len);
        op[n] = 1;
        res += test_unit(n-1, op, val, len);      
    }
    return res;
}

int test(uint64_t* list_eq)
{
    int len = 0;
    while (list_eq[len] != 0) len +=1;
    int operateurs[50] = {0};

    int res = test_unit(len-2, operateurs, list_eq, len);
    
    if (res > 0) return 1;
    else return 0;
}

int main()
{
    uint64_t result = 0;

    uint64_t list_eq[50] = {0};
    FILE* input = fopen(_INPUT_FILE_PATH, "r");
    char car = 0;
    int idx = 0;
    for (int i=0; i<850; i++) {
        idx = 0;
        uint64_t list_eq[50] = {0};
        do {
            car = fgetc(input);

            if (car >= '0' && car <= '9') {
                list_eq[idx] *= 10;
                list_eq[idx] += (uint64_t) car-'0';
            } if (car == ' ') {
                idx += 1;
            } if (car == '\n') {
                idx= 0;
            }
        } while (car != '\n');

        result += list_eq[0]*test(list_eq);
        printf("%d/850\n", i+1);
        
    } fclose(input);

    printf("\nle résulat est : %llu\n", result);

    return 0;
}