#include <stdio.h>
#include <stdlib.h>
#include <mysql/mysql.h>
#define MAX 100
static char *host = "localhost";
static char *user = "root";
static char *pass = "Umit@111";
static char *dbname = "railway_reservation";

unsigned int port = 3306;
static char *unix_socket = NULL; // connection
unsigned int flag = 0;           // odbc
int main()
{
    MYSQL *conn; // connection variable
    MYSQL_RES *res;
    MYSQL_ROW row;
    conn = mysql_init(NULL); // to initialize mysql structure

    if (!(mysql_real_connect(conn, host, user, pass, dbname, port, unix_socket, flag)))
    {
        fprintf(stderr, "\nError : %s [%d] \n ", mysql_error(conn), mysql_errno(conn));
        exit(0);
    }

    printf("Connection Established!!\n\n");
    printf("Enter Table Name : ");
    char table_name[MAX];
    scanf("%s",&table_name);
    mysql_query(conn,"CREATE TABLE &table_name");
    res=mysql_store_result(conn);
    while(row=mysql_fetch_row(res)){

    }

    mysql_close(conn);
    return EXIT_SUCCESS;
}