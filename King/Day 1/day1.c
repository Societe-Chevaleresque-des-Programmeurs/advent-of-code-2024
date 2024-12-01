#include <unistd.h>
#include <stdio.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>

#define LENGTH 1000

void bubble_sort(long *numbers) {
	long tmp;
	for (unsigned short i = 0; i<LENGTH-1; i++) {
	    for (unsigned short j = 0; j<LENGTH-i-1; j++) {
	    	if (numbers[j] > numbers[j+1]) 
	      	{
	        	tmp = numbers[j];
	        	numbers[j] = numbers[j+1];
	        	numbers[j+1] = tmp;
	      	}
	    }
	}
}


/* PART 1 */
void p1(long *left, long *right) {
	long sub;
	unsigned long distance = 0;

	for(unsigned short i = 0; i<LENGTH; i++) {
		sub = left[i] - right[i];
		if(sub < 0)
			distance = distance - sub;
		else
			distance = distance + sub;
	}

	printf("Distance : %ld\n", distance);
	// result : 2264607
}

/* PART 2 */
void p2(long *left, long *right) {
	unsigned long similarity = 0;
	unsigned short count;
	for (unsigned short i = 0; i<LENGTH; i++) {
		count = 0;
		for (unsigned short j = 0; j<LENGTH; j++) {
			if (left[i] == right[j])
				count++;
		}
		similarity = similarity + (left[i] * count);
	}
	printf("Similarity : %lu\n", similarity);
	// result : 19457120
}

int main() {
	long left[LENGTH];
	long right[LENGTH];
	char left_number[6];
	char right_number[6];

	int fd = open("input.txt", O_RDONLY);
	if(fd == -1) {
		printf("Error opening the file %d.\n", fd);
		return -1;
	}

	for(short i = 0; i<LENGTH; i++) {

		read(fd, left_number, 5);
		left_number[5] = '\0';
		lseek(fd, 3, SEEK_CUR);
		read(fd, right_number, 5);
		right_number[5] = '\0';
		lseek(fd, 1, SEEK_CUR);

		long left_number_long = strtol(left_number, NULL, 10);
		long right_number_long = strtol(right_number, NULL, 10);

		left[i] = left_number_long;
		right[i] = right_number_long;
	}

	close(fd);
	bubble_sort(left);
	bubble_sort(right);

	p1(left, right);
	p2(left, right);

	return 1;
}