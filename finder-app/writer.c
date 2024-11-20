#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>

int main(int argc, char *argv[]) {
    // Open syslog for logging
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    // Check if the required arguments are provided
    if (argc != 3) {
        syslog(LOG_ERR, "Error: Invalid number of arguments. Expected 2, got %d", argc - 1);
        fprintf(stderr, "Usage: %s <file_path> <string_to_write>\n", argv[0]);
        closelog();
        return 1;
    }

    // Get arguments
    const char *file_path = argv[1];
    const char *write_string = argv[2];

    // Open the file for writing
    FILE *file = fopen(file_path, "w");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Could not open file %s for writing", file_path);
        perror("fopen");
        closelog();
        return 1;
    }

    // Write the string to the file
    if (fputs(write_string, file) == EOF) {
        syslog(LOG_ERR, "Error: Could not write to file %s", file_path);
        perror("fputs");
        fclose(file);
        closelog();
        return 1;
    }

    // Successfully wrote to the file
    syslog(LOG_DEBUG, "Writing \"%s\" to \"%s\"", write_string, file_path);
    fclose(file);

    // Close syslog
    closelog();
    return 0;
}

