#ifndef _LOG_H_
#define _LOG_H_

#include <stdio.h>
#include <errno.h>
#include <string.h>

#define LOG_LEVEL 0
#define LV_TRACE 1
#define LV_DEBUG 2
#define LV_INFO  4
#define LV_ERROR 8
#define LV_ALERT 16

FILE *LOG_PTR;
#define LOG_INIT()  LOG_PTR=fopen("/root/hello.log","a");
#define LOG(level, format, ...) \
	do { \
		if ( level >= LOG_LEVEL ) {\
			fprintf(LOG_PTR, "[%c] [%s:%d] "format"\n", \
						 #level[3],  __FUNCTION__, __LINE__, ##__VA_ARGS__); \
		} \
	} while(0)
	
#define trace(format, ...) LOG(LV_TRACE, format, ##__VA_ARGS__)
#define debug(format, ...) LOG(LV_DEBUG, format, ##__VA_ARGS__)
#define info(format, ...)  LOG(LV_INFO , format, ##__VA_ARGS__)
#define error(format, ...) LOG(LV_ERROR, format, ##__VA_ARGS__)
#define alert(format, ...) LOG(LV_ALERT, format, ##__VA_ARGS__)


#endif