/*
 * Tool for executing _interactive_ eserver in 'detachable' mode.
 * Eserver does not run with /dev/null as standard input
 * (as it is when start-stop-daemon --start --background ...).
 * So we open a pipe and set its read end as stdin, then exec eserver.
 */

#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv){
	if(argc < 2){
		return EXIT_FAILURE;
	}
	int pipes[2];
	if(pipe(pipes) == -1){
		return EXIT_FAILURE;
	}
	if(dup2(pipes[0], STDIN_FILENO) != STDIN_FILENO){
		return EXIT_FAILURE;
	}
	close(pipes[0]);
	execv(argv[1], argv + 1);
	return EXIT_FAILURE;
}
