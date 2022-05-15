all: client Server

client: Client.a
	gcc -std=gnu99 -g -o client Client.a
Client.a: Client.o
	ar -rcs Client.a Client.o
Client.o: Client.c 
	gcc -std=gnu99 -g -c Client.c 

Server: Server.a
	gcc -pthread -std=gnu99 -g -o Server Server.a
Server.a: Server.o
	ar -rcs Server.a Server.o
Server.o: Server.c 
	gcc -pthread -std=gnu99 -g -c Server.c 



.PHONY: clean #.PHONY means that clean is not a file.
clean:
	rm -f *.o *.a  client Server