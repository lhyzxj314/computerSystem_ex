#include <sys/types.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <stdio.h>

#define N 10

int main() {
	int status, i;
	pid_t pid, pid1;
	
	for (i = 0; i < N; i++)
		if ((pid = fork()) == 0) {
			printf("pid = %d\n", pid);
			exit(100 + i);
		}

	while ((pid1 = waitpid(-1, &status, 0) > 0)) {
		if (WIFEXITED(status))
			printf("child %d terminated normally with exit status = %d\n", 
				pid1, WEXITSTATUS(status));
		else
			printf("child %d terminated abnormally\n", pid);
	}
	
	if (errno != ECHILD)
		fprintf(stderr, "%s: %s\n", "waitpid error", strerror(errno));
	exit(0);
}
