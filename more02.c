#include<stdio.h>
#include<stdlib.h>
#define PAGELEN 24
#define LINELEN 512

void do_more(FILE *);
int see_more(FILE *);

int main(int ac, char *av[]) {
	FILE *fp;
	if (ac == 1)
		do_more(stdin);
	else {
		while (--ac) {
			if ((fp = fopen(* ++av, "r")) != NULL) {
				do_more(fp);
				fclose(fp);
			} else
				exit(1);
		}
	}
	return 0;
}

void do_more(FILE *fp) {
	char line[LINELEN];
	int num_of_lines = 0;
	int reply;
	// 屏幕和键盘对应的文件
	FILE *fp_tty = fopen("/dev/pts/0", "r");
	if (fp_tty == NULL) {
		printf("test");
		exit(1);
	}
	while (fgets(line, LINELEN, fp)) {        // more input
		if (num_of_lines == PAGELEN) {       // 满屏
			reply = see_more(fp_tty);              // 询问用户
			if (reply == 0)
				break;
			num_of_lines -= reply;
		}

		if (fputs(line, stdout) == EOF)
			exit(1);

		num_of_lines++;
	}
}

int see_more(FILE *cmd) {
	int c;
	printf("\033[7m more? \033[m");
	while ((c = getc(cmd)) != EOF) {
		if (c == 'q')
			return 0;
		if (c == ' ')
			return PAGELEN;
		if (c == '\n')
			return 1;
	}
	return 0;
}