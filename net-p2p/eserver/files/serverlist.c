/*
 * Tool for creating serverList.met file.
 * Only IP address and port number of each specified server are
 * written to output.
 * I do not know about strict specification of .met files,
 * especially about byte order of integers. This tool works
 * at least on my little endian amd64 machine.
 */

#include <arpa/inet.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static void write(const void *data, size_t len){
	if(fwrite(data, len, 1, stdout) < 1){
		exit(EXIT_FAILURE);
	}
}

int main(int argc, char **argv){
	if(argc < 2){
		printf("Usage: %s ip:port ... > serverList.met\n", argv[0]);
		return EXIT_SUCCESS;
	}
	static const uint8_t magic = 0x0e;
	// First write the magic number.
	write(&magic, 1);
	uint32_t count = argc - 1;
	// Number of servers as 32-bit integer.
	write(&count, 4);
	for(char **addr_s = argv + 1; addr_s < argv + argc; addr_s++){
		char *port_s = strchr(*addr_s, ':');
		if(port_s == NULL){
			return EXIT_FAILURE;
		}
		*port_s++ = '\0';
		struct in_addr addr;
		if(inet_pton(AF_INET, *addr_s, &addr) < 0){
			return EXIT_FAILURE;
		}
		// IP address.
		write(&addr.s_addr, 4);
		uint16_t port;
		if(sscanf(port_s, "%" SCNu16, &port) != 1){
			return EXIT_FAILURE;
		}
		// Port number.
		write(&port, 2);
		static uint32_t zero = 0;
		// Tags count (no tags).
		write(&zero, 4);
	}
	return EXIT_SUCCESS;
}
